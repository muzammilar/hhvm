<?hh

async function throwExn() :Awaitable<mixed>{
  RescheduleWaitHandle::create(
    RescheduleWaitHandle::QUEUE_NO_PENDING_IO,
    1,
  );
  throw new Exception();
}

<<__EntryPoint>>
async function main() :Awaitable<mixed>{
  include 'async-implicit.inc';

  await IntContext::genStart(new Base(1), () ==> async {
    try {
      await IntContext::genStart(new Base(2), () ==> async {
        RescheduleWaitHandle::create(
          RescheduleWaitHandle::QUEUE_NO_PENDING_IO,
          1,
        );
        var_dump(IntContext::getContext()->getPayload());
        await throwExn();
      });
    } catch (Exception $e) {
      var_dump('caught!');
      var_dump(IntContext::getContext()->getPayload());
    }
  });
}
