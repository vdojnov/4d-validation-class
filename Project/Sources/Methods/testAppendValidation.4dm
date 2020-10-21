//%attributes = {}
var $v : cs:C1710.ValidationClass
var $email,$notEmail : Text
var $num : Integer
$email:="viktor@clearviewsys.com"
$notEmail:="viktor@clearviewsys"
$num:=5

$v:=cs:C1710.ValidationClass.new()
$v.addMandatory("email";$email;"Primary Email")
$v.addNotMandatory("email";$notEmail;"Secondary Email")

$v.addMandatory("Name";"Viktor";"First Name")
$v.addMandatory("Name";"D0jn0v";"Last Name")

$v.addNotMandatory("numbetween";5;1;10;"Happy Scale")
$v.addNotMandatory("dateBetween";!2011-12-31!;!2017-12-31!;!2019-12-31!;"Datjfhfge Field")

$v.validate()
$v.showMessages()

//Todo
//Dialog: give it an object that type the feilds
//craete a method to do this
