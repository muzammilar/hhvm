<?hh

<<__EntryPoint>>
function main_createfunction() :mixed{
$db = new PDO('sqlite::memory:');
$db->sqliteCreateFunction('length', HH\dynamic_fun('strlen'), 1);

$db->exec("DROP TABLE IF EXISTS test_table;");
$db->exec("CREATE TABLE test_table (test_field TEXT);");
$db->exec("INSERT INTO test_table VALUES('text1');");
$db->exec("INSERT INTO test_table VALUES('text2');");

$q = "SELECT * FROM test_table WHERE LENGTH(test_field) < 75";
$sth = $db->prepare($q);
$r = $sth->execute();
$rows = $sth->fetchAll();
var_dump($rows);
}
