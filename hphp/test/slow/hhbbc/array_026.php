<?hh

function junk() :mixed{ return 2; }
function bar() :mixed{
  $x = dict['x' => junk()];
  $x['x'] += 1;
  $val = $x['x'];
  var_dump(is_null($val));
  var_dump(is_array($val));
  var_dump(is_array($x));
  var_dump($x);
}

<<__EntryPoint>>
function main_array_026() :mixed{
bar();
}
