//%attributes = {}
//CONFIRM("hello";"continue";"Go Back")
//DISPLAY NOTIFICATION("Clear View Systems";"Welcome to CXR6!"; 20)
//If (OK=1)
//ALERT("Proceed")
//Else 
//ALERT("Operation canceled.")
//End if 

//$a:=1
//$b:=2
//$c:=new object("f";Formula($a+$b))
//assert($c.f()=3)

//$a:=2
//$b:=2
//ASSERT($c.f()=4)
var $v : cs:C1710.ValidationClass
var $email,$notEmail : Text
$email:="viktor@clearviewsys.com"
$notEmail:="viktor@clearviewsys"

$v:=cs:C1710.ValidationClass.new()
$v.addMandatory("email";$email)
$v.addNotMandatory("Name";"Viktor")

$v.validate()
$v.showMessages()







//$fname:=Formula(This.validated:=$v.validateName(This.val;False))
//$femail:=Formula($v.validateEmail(This.val;true))
//$o:=New object("val";"Viktor")
//$obj:=New object("val";"viktor@clearviewsys.com")
//$o.validate:=$fname
//$obj.validate:=$femail

//$o.validate()
//$obj.validate()

//ALERT(String($obj.validate()))
//  //ALERT(String($v.validateEmail($obj.val;True)))
//$obj.val:="viktor@clearviewsys"
//ALERT(String($obj.validate()))




//$v.showMessages()
//ASSERT($o.validated=True)
//ASSERT($obj.validated=False)