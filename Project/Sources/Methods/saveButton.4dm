//%attributes = {}
var $validator,$newPerson : Object
var $isValidEmail,$isValidPhone,$isValidName : Boolean

$validator:=cs:C1710.ValidationClass.new()

$validator.validateName(Form:C1466.Name;True:C214;"Name")
$validator.validateEmail(Form:C1466.Email;False:C215;"Email")
$validator.validateIfBetween(Date:C102(Form:C1466.L);!2017-01-20!;!2019-01-20!;False:C215;"Date")

$validator.showMessages()

If ($validator.errors.length=0)
	$newPerson:=ds:C1482.People.new()
	$newPerson.email:=Form:C1466.Email
	$newPerson.name:=Form:C1466.Name
	$newPerson.save()
End if 