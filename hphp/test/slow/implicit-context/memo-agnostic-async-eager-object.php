<?hh

async function g(): Awaitable<mixed>{
  echo "in g 1 should be C got ";
  echo TestAsyncContext::getContext()->name() . "\n";
  echo "in g 2 should be C got ";
  echo TestAsyncContext::getContext()->name() . "\n";
  echo "done with g should be C got ";
  echo TestAsyncContext::getContext()->name() . "\n";
}

async function h(): Awaitable<mixed>{
  echo "in h should be C got ";
  echo TestAsyncContext::getContext()->name() . "\n";
  await TestAsyncContext::genRunWith(new D, async () ==> {
    echo "in lambda should be D got ";
    echo TestAsyncContext::getContext()->name() . "\n";
    echo "done with lambda should be D got ";
    echo TestAsyncContext::getContext()->name() . "\n";
  });
  echo "done with h should be C got ";
  echo TestAsyncContext::getContext()->name() . "\n";
}

async function f(): Awaitable<mixed>{
  echo "in f should be C got ";
  echo TestAsyncContext::getContext()->name() . "\n";
  concurrent {
    await g();
    await h();
  };
  echo "done with f should be C got ";
  echo TestAsyncContext::getContext()->name() . "\n";
}

<<__EntryPoint>>
async function main(): Awaitable<mixed>{
  include 'memo-agnostic-async.inc';

  await TestAsyncContext::genRunWith(new C, f<>);
}
