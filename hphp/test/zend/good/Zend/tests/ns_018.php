<?hh
namespace test;
<<__DynamicallyCallable>>
function foo() :mixed{
    return __FUNCTION__;
}
<<__EntryPoint>> function main(): void {
$x = __NAMESPACE__ . "\\foo";
echo \HH\dynamic_fun($x)(),"\n";
}
