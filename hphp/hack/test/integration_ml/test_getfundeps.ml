(*
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the "hack" directory of this source tree.
 *
 *
 *)

open Hh_prelude
module Test = Integration_test_base

let f1 =
  ( "f1.php",
    {|<?hh
function test(F2A $a, F3B $b): int {
  return x() + $a->f() + $b->f() + $a->f() + x();
}

function x1(): int {
  return 1;
}

function getf3b(): F3B {
  return new F3B();
}
|}
  )

let f2 =
  ( "f2.php",
    {|<?hh
class F2A {

  public function __construct() {
  }

  public function f(): int {
    $f3b1 = getf3b();
    $f3b2 = getf3b();
    return x()
  }
}
|}
  )

let f3 =
  ( "f3.php",
    {|<?hh
class F3B {
  public function f(): int {
    return 100;
  }
}

async function g(): Awaitable<void> {
  await async {
    (new F3B())->f();
  };
}

function h(): void {
  $a = new F2A();
  $a->f();
}

interface IA {}

class A {
  public function g(): int {
    return 1;
  }
}

class B extends A implements IA {
}

function rxshallow1(): int {
  return 3;
}

function rx1(): int {
  return 4;
}

function ff(A $a): int {
  return $a->g() + rxshallow1() + rx1();
}
|}
  )

let f4 =
  ( "f4.php",
    {|<?hh
  class A1 {
    public static function sm(): int {
      return 1;
    }
  }
  class B1 extends A1 {
    public function m(): int {
      return self::sm();
    }
  }
|}
  )

let f5 =
  ( "f5.php",
    {|<?hh

function f4main(): int {
  $a = f5f<>;
  $c = new C();
  $m = () ==> $c->m();
  $cm = C::sm<>;
}

function f5f(): int {
  return 1;
}
class C {
  public static function sm(): int {
    return 1;
  }
  public function m(): int {
    return 1;
  }
}

function f5g(): int {
  return D::getc()->m();
}

class D {
  public static function getc(): C {
    return new C();
  }
}
|}
  )

let f6 =
  ( "f6.php",
    {|<?hh
function f6f(): int {
  $a = () ==> {
    f6g();
  };
}
function f6g(): void {
}
|}
  )

let f7 =
  ( "f7.php",
    {|<?hh
function f7f((function(): void) $a): void {
  $a();
  $b = () ==> {
    return 1;
  };
  $b();
}
|}
  )

let f8 =
  ( "f8.php",
    {|<?hh

function f8main(): void {
  $_ = f8f<>;
  $_ = C8::sf8<>;
}

function f8f(): void {}
class C8 { public static function sf8(): void {} }
|}
  )

let files = [f1; f2; f3; f4; f5; f6; f7; f8]

let tests =
  [
    ( (fst f1, 2, 11),
      {|{"position":{"file":"/f1.php","line":2,"character":11},"deps":[null,null,{"name":"F2A::f","kind":"method","position":{"filename":"/f2.php","line":7,"char_start":19,"char_end":19}},{"name":"F3B::f","kind":"method","position":{"filename":"/f3.php","line":3,"char_start":19,"char_end":19}}]}|}
    );
    ( (fst f2, 7, 19),
      {|{"position":{"file":"/f2.php","line":7,"character":19},"deps":[null,{"name":"getf3b","kind":"function","position":{"filename":"/f1.php","line":10,"char_start":10,"char_end":15}}]}|}
    );
    (* should find class (since constructor is not defined) and method call *)
    ( (fst f3, 8, 16),
      {|{"position":{"file":"/f3.php","line":8,"character":16},"deps":[{"name":"F3B","kind":"class","position":{"filename":"/f3.php","line":2,"char_start":7,"char_end":9}},{"name":"F3B::f","kind":"method","position":{"filename":"/f3.php","line":3,"char_start":19,"char_end":19}}]}|}
    );
    (* should find constructor and method *)
    ( (fst f3, 14, 10),
      {|{"position":{"file":"/f3.php","line":14,"character":10},"deps":[{"name":"F2A::__construct","kind":"method","position":{"filename":"/f2.php","line":4,"char_start":19,"char_end":29}},{"name":"F2A::f","kind":"method","position":{"filename":"/f2.php","line":7,"char_start":19,"char_end":19}}]}|}
    );
    (* should find reactive function *)
    ( (fst f3, 38, 10),
      {|{"position":{"file":"/f3.php","line":38,"character":10},"deps":[{"name":"rx1","kind":"function","position":{"filename":"/f3.php","line":34,"char_start":10,"char_end":12}},{"name":"rxshallow1","kind":"function","position":{"filename":"/f3.php","line":30,"char_start":10,"char_end":19}},{"name":"A::g","kind":"method","position":{"filename":"/f3.php","line":22,"char_start":19,"char_end":19}}]}|}
    );
    (* should find static method*)
    ( (fst f4, 8, 21),
      {|{"position":{"file":"/f4.php","line":8,"character":21},"deps":[{"name":"A1::sm","kind":"method","position":{"filename":"/f4.php","line":3,"char_start":28,"char_end":29}}]}|}
    );
    (* should find static method pointer, class, methods and function  *)
    ( (fst f5, 3, 10),
      {|{"position":{"file":"/f5.php","line":3,"character":10},"deps":[{"name":"f5f","kind":"function","position":{"filename":"/f5.php","line":10,"char_start":10,"char_end":12}},{"name":"C","kind":"class","position":{"filename":"/f5.php","line":13,"char_start":7,"char_end":7}},{"name":"C::m","kind":"method","position":{"filename":"/f5.php","line":17,"char_start":19,"char_end":19}},{"name":"C::sm","kind":"method","position":{"filename":"/f5.php","line":14,"char_start":26,"char_end":27}}]}|}
    );
    (* handle chained calls *)
    ( (fst f5, 22, 10),
      {|{"position":{"file":"/f5.php","line":22,"character":10},"deps":[{"name":"C::m","kind":"method","position":{"filename":"/f5.php","line":17,"char_start":19,"char_end":19}},{"name":"D::getc","kind":"method","position":{"filename":"/f5.php","line":27,"char_start":26,"char_end":29}}]}|}
    );
    (* should look into lambdas *)
    ( (fst f6, 2, 10),
      {|{"position":{"file":"/f6.php","line":2,"character":10},"deps":[{"name":"f6g","kind":"function","position":{"filename":"/f6.php","line":7,"char_start":10,"char_end":12}}]}|}
    );
    (* locals as call targets *)
    ( (fst f7, 2, 10),
      {|{"position":{"file":"/f7.php","line":2,"character":10},"deps":[{"name":"$a","kind":"local","position":{"filename":"/f7.php","line":2,"char_start":33,"char_end":34}},{"name":"$b","kind":"local","position":{"filename":"/f7.php","line":4,"char_start":3,"char_end":4}}]}|}
    );
    (* first-class function pointers *)
    ( (fst f8, 3, 10),
      {|{"position":{"file":"/f8.php","line":3,"character":10},"deps":[{"name":"f8f","kind":"function","position":{"filename":"/f8.php","line":8,"char_start":10,"char_end":12}},{"name":"C8::sf8","kind":"method","position":{"filename":"/f8.php","line":9,"char_start":35,"char_end":37}}]}|}
    );
  ]

let test () =
  let env =
    Test.setup_server
      ()
      ~hhi_files:(Hhi.get_raw_hhi_contents () |> Array.to_list)
  in
  let env = Test.setup_disk env files in
  let h = ServerFunDepsBatch.handlers in
  let do_test ((file, line, col), expected) =
    let ctx = Provider_utils.ctx_from_server_env env in
    let pos_list = [(Relative_path.from_root ~suffix:file, line, col)] in
    let result = ServerRxApiShared.helper h ctx [] pos_list in
    if not (List.equal String.equal result [expected]) then
      let msg =
        "Unexpected test result\nExpected:\n"
        ^ expected
        ^ "\nBut got:\n"
        ^ String.concat ~sep:"\n" result
      in
      Test.fail msg
  in
  List.iter tests ~f:do_test
