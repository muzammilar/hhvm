/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree.
 */

#include "squangle/mysql_client/QueryOperation.h"
#include "squangle/mysql_client/OperationHelpers.h"

namespace facebook::common::mysql_client {

QueryOperation::QueryOperation(
    std::unique_ptr<FetchOperationImpl> impl,
    Query&& query)
    : FetchOperation(std::move(impl), std::vector<Query>{std::move(query)}),
      query_result_(std::make_unique<QueryResult>(0)) {}

void QueryOperation::notifyInitQuery() {
  auto* row_stream = rowStream();
  if (row_stream) {
    // Populate RowFields, this is the metadata of rows.
    query_result_->setRowFields(
        row_stream->getEphemeralRowFields()->makeBufferedFields());
  }
}

void QueryOperation::notifyRowsReady() {
  // QueryOperation acts as consumer of FetchOperation, and will buffer the
  // result.
  auto row_block =
      makeRowBlockFromStream(query_result_->getSharedRowFields(), rowStream());

  // Empty result set
  if (row_block.numRows() == 0) {
    return;
  }

  query_result_->appendRowBlock(std::move(row_block));
  if (buffered_query_callback_) {
    buffered_query_callback_(
        *this, query_result_.get(), QueryCallbackReason::RowsFetched);
  }
}

bool QueryOperation::notifyQuerySuccess(bool more_results) {
  if (more_results) {
    // This is the single-query API; we can't support multi-queries here, so if
    // we have more results we need to generate an error and cancel.
    setAsyncClientError(
        (unsigned int)SquangleErrno::SQ_INVALID_API_USAGE,
        "Multi-queries are not supported in this API - "
        "use the multi-query API instead");
    cancel();
    return false;
  }

  query_result_->setOperationResult(OperationResult::Succeeded);
  query_result_->setNumRowsAffected(FetchOperation::currentAffectedRows());
  query_result_->setLastInsertId(FetchOperation::currentLastInsertId());
  query_result_->setRecvGtid(FetchOperation::currentRecvGtid());
  query_result_->setMysqlInfo(FetchOperation::currentMysqlInfo());
  query_result_->setRowsMatched(FetchOperation::currentRowsMatched());
  query_result_->setWasSlow(FetchOperation::wasSlow());
  query_result_->setResponseAttributes(FetchOperation::currentRespAttrs());
  query_result_->setWarningsCount(FetchOperation::currentWarningsCount());

  query_result_->setPartial(false);

  // We are not going to make callback to user now since this only one query,
  // we make when we finish the operation

  return true;
}

void QueryOperation::notifyFailure(OperationResult result) {
  // Next call will be to notify user
  query_result_->setOperationResult(result);
}

void QueryOperation::notifyOperationCompleted(OperationResult result) {
  if (!buffered_query_callback_) {
    return;
  }

  // Nothing that changes the non-callback state is safe to be done here.
  auto reason =
      (result == OperationResult::Succeeded ? QueryCallbackReason::Success
                                            : QueryCallbackReason::Failure);
  buffered_query_callback_(*this, query_result_.get(), reason);
  // Release callback since no other callbacks will be made
  buffered_query_callback_ = nullptr;
}

} // namespace facebook::common::mysql_client
