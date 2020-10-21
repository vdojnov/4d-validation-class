//%attributes = {}
var $validator,$newPerson : Object
var $isValidEmail,$isValidPhone,$isValidName : Boolean

$validator:=cs:C1710.ValidationClass.new()
//alert(string(undefined(Form.Name)))
//$validator.validateName(Form.Name;True;"Name")
$validator.validateEmail(Form:C1466.Email;False:C215;"Email")
//$validator.validateIfBetween(Date(Form.L);!2017-01-20!;!2019-01-20!;False;"Date")

$validator.showMessages()
If (OK=1)
	$newPerson:=ds:C1482.People.new()
	$newPerson.email:=Form:C1466.Email
	$newPerson.name:=Form:C1466.Name
	$newPerson.save()
End if 
//If ($validator.errors.length=0)
//$newPerson:=ds.People.new()
//$newPerson.email:=Form.Email
//$newPerson.name:=Form.Name
//$newPerson.save()
//End if 
