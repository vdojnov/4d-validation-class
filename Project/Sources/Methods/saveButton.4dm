//%attributes = {}
var $tableName,$method : Text
$tableName:=Table name:C256(Current form table:C627)
$method:=$tableName+"validate"
EXECUTE METHOD:C1007($method)
