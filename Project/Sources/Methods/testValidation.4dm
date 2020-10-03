//%attributes = {}
var $email,$notEmail,$phoneNumber,$notPhoneNumber,$name,$notName : Text
var $required : Boolean
var $validator : Object
var $date,$notDate : Date
var $int,$notInt,$countErr,$countWarn,$i : Integer

$email:="viktor@clearviewsys.com"
$notEmail:="viktor@clearviewsys"
$phoneNumber:="6042225555"
$notPhoneNumber:="604ttt5555"
$date:=!2018-01-20!
$notDate:=!2011-01-20!
$int:=5
$notInt:=11
$name:="Viktor"
$notName:="5863241"



//--------------------------------------
//ONE CLASS WITH VALIDATION FUNCTIONS
//  Class ValidationClass
//     |--> Function validateEmail($email)
//     |--> Function validatePhoneNumber($phoneNumber)
//     |--> etc.
//--------------------------------------

//--------------------------------------------------------------------|
// Validate Name                                                      |
//--------------------------------------------------------------------|
// Required Feild                                                     |
//----------------                                                    |
// Valid input                                                        |
// Invalid Input                                                      |
// Empty Input                                                        |
// Not Required Feild                                                 |
//-------------------                                                 |
// Valid input                                                        |
// Invalid Input                                                      |
// Empty Input                                                        |
//--------------------------------------------------------------------|

$validator:=cs:C1710.ValidationClass.new()
$countErr:=0
$countWarn:=0
$required:=True:C214

//--------------------------------------------------------------------
// Validate Name
//--------------------------------------------------------------------
// Required Feild
//----------------
// Valid input
$validator.validateName($name;$required;"Name1")
ASSERT:C1129($validator.errors.length=$countErr)
ASSERT:C1129($validator.warnings.length=$countWarn)

// Invalid Input
$validator.validateName($notName;$required;"Name2")
$countErr:=$countErr+1
ASSERT:C1129($validator.errors.length=$countErr)
ASSERT:C1129($validator.warnings.length=$countWarn)
ASSERT:C1129($validator.errors[$validator.errors.length-1].type="Name2")

// Empty Input
$validator.validateName("";$required;"Name3")
$countErr:=$countErr+1
ASSERT:C1129($validator.errors.length=$countErr)
ASSERT:C1129($validator.warnings.length=$countWarn)
ASSERT:C1129($validator.errors[$validator.errors.length-1].type="Name3")

// Not Required Feild
//-------------------
// Valid input
$validator.validateName($name;Not:C34($required);"Name4")
ASSERT:C1129($validator.errors.length=$countErr)
ASSERT:C1129($validator.warnings.length=$countWarn)

// Invalid Input
$validator.validateName($notName;Not:C34($required);"Name5")
$countErr:=$countErr+1
ASSERT:C1129($validator.errors.length=$countErr)
ASSERT:C1129($validator.warnings.length=$countWarn)
ASSERT:C1129($validator.errors[$validator.errors.length-1].type="Name5")

// Empty Input
$validator.validateName("";Not:C34($required);"Name6")
$countWarn:=$countWarn+1
ASSERT:C1129($validator.errors.length=$countErr)
ASSERT:C1129($validator.warnings.length=$countWarn)
ASSERT:C1129($validator.warnings[$validator.warnings.length-1].type="Name6")
//--------------------------------------------------------------------



//--------------------------------------------------------------------
// Validate Email
//--------------------------------------------------------------------
// Required Feild
//----------------
// Valid input
$validator.validateEmail($email;$required;"Email1")
ASSERT:C1129($validator.errors.length=$countErr)
ASSERT:C1129($validator.warnings.length=$countWarn)

// Invalid Input
$validator.validateEmail($notEmail;$required;"Email2")
$countErr:=$countErr+1
ASSERT:C1129($validator.errors.length=$countErr)
ASSERT:C1129($validator.warnings.length=$countWarn)
ASSERT:C1129($validator.errors[$validator.errors.length-1].type="Email2")

// Empty Input
$validator.validateEmail("";$required;"Email3")
$countErr:=$countErr+1
ASSERT:C1129($validator.errors.length=$countErr)
ASSERT:C1129($validator.warnings.length=$countWarn)
ASSERT:C1129($validator.errors[$validator.errors.length-1].type="Email3")

// Not Required Feild
//-------------------
// Valid input
$validator.validateEmail($email;Not:C34($required);"Email4")
ASSERT:C1129($validator.errors.length=$countErr)
ASSERT:C1129($validator.warnings.length=$countWarn)

// Invalid Input
$validator.validateEmail($notEmail;Not:C34($required);"Email5")
$countErr:=$countErr+1
ASSERT:C1129($validator.errors.length=$countErr)
ASSERT:C1129($validator.warnings.length=$countWarn)
ASSERT:C1129($validator.errors[$validator.errors.length-1].type="Email5")

// Empty Input
$validator.validateEmail("";Not:C34($required);"Email6")
$countWarn:=$countWarn+1
ASSERT:C1129($validator.errors.length=$countErr)
ASSERT:C1129($validator.warnings.length=$countWarn)
ASSERT:C1129($validator.warnings[$validator.warnings.length-1].type="Email6")
//--------------------------------------------------------------------



//--------------------------------------------------------------------
//Validate Phone Number
//--------------------------------------------------------------------
// Required Feild
//----------------
// Valid input
$validator.validatePhoneNumber($phoneNumber;$required;"Phone1")
ASSERT:C1129($validator.errors.length=$countErr)
ASSERT:C1129($validator.warnings.length=$countWarn)

// Invalid Input
$validator.validatePhoneNumber($notPhoneNumber;$required;"Phone2")
$countErr:=$countErr+1
ASSERT:C1129($validator.errors.length=$countErr)
ASSERT:C1129($validator.warnings.length=$countWarn)
ASSERT:C1129($validator.errors[$validator.errors.length-1].type="Phone2")

// Empty Input
$validator.validatePhoneNumber("";$required;"Phone3")
$countErr:=$countErr+1
ASSERT:C1129($validator.errors.length=$countErr)
ASSERT:C1129($validator.warnings.length=$countWarn)
ASSERT:C1129($validator.errors[$validator.errors.length-1].type="Phone3")

// Not Required Feild
//-------------------
// Valid input
$validator.validatePhoneNumber($phoneNumber;Not:C34($required);"Phone4")
ASSERT:C1129($validator.errors.length=$countErr)
ASSERT:C1129($validator.warnings.length=$countWarn)

// Invalid Input
$validator.validatePhoneNumber($notPhoneNumber;Not:C34($required);"Phone5")
$countErr:=$countErr+1
ASSERT:C1129($validator.errors.length=$countErr)
ASSERT:C1129($validator.warnings.length=$countWarn)
ASSERT:C1129($validator.errors[$validator.errors.length-1].type="Phone5")

// Empty Input
$validator.validatePhoneNumber("";Not:C34($required);"Phone6")
$countWarn:=$countWarn+1
ASSERT:C1129($validator.errors.length=$countErr)
ASSERT:C1129($validator.warnings.length=$countWarn)
ASSERT:C1129($validator.warnings[$validator.warnings.length-1].type="Phone6")
//--------------------------------------------------------------------


//--------------------------------------------------------------------
//Validate Number Between
//--------------------------------------------------------------------
// Required Feild
//----------------
// Valid input
$validator.validateIfNumBetween($int;1;10;$required;"Number1")
ASSERT:C1129($validator.errors.length=$countErr)
ASSERT:C1129($validator.warnings.length=$countWarn)

// Invalid Input
$validator.validateIfNumBetween($notInt;1;10;$required;"Number2")
$countErr:=$countErr+1
ASSERT:C1129($validator.errors.length=$countErr)
ASSERT:C1129($validator.warnings.length=$countWarn)
ASSERT:C1129($validator.errors[$validator.errors.length-1].type="Number2")

// Not Required Feild
//-------------------
// Valid input
$validator.validateIfNumBetween($int;1;10;Not:C34($required);"Number3")
ASSERT:C1129($validator.errors.length=$countErr)
ASSERT:C1129($validator.warnings.length=$countWarn)

// Invalid Input
$validator.validateIfNumBetween($notInt;1;10;Not:C34($required);"Number4")
$countErr:=$countErr+1
ASSERT:C1129($validator.errors.length=$countErr)
ASSERT:C1129($validator.warnings.length=$countWarn)
ASSERT:C1129($validator.errors[$validator.errors.length-1].type="Number4")

//--------------------------------------------------------------------



//--------------------------------------------------------------------
//Validate Date Between
//--------------------------------------------------------------------
// Required Feild
//----------------
// Valid input
$validator.validateIfDateBetween($date;!2017-01-20!;!2019-01-20!;$required;"Date1")
ASSERT:C1129($validator.errors.length=$countErr)
ASSERT:C1129($validator.warnings.length=$countWarn)

// Invalid Input
$validator.validateIfDateBetween($notDate;!2017-01-20!;!2019-01-20!;$required;"Date2")
$countErr:=$countErr+1
ASSERT:C1129($validator.errors.length=$countErr)
ASSERT:C1129($validator.warnings.length=$countWarn)
ASSERT:C1129($validator.errors[$validator.errors.length-1].type="Date2")

// Not Required Feild
//-------------------
// Valid input
$validator.validateIfDateBetween($date;!2017-01-20!;!2019-01-20!;Not:C34($required);"Date3")
ASSERT:C1129($validator.errors.length=$countErr)
ASSERT:C1129($validator.warnings.length=$countWarn)

// Invalid Input
$validator.validateIfDateBetween($notDate;!2017-01-20!;!2019-01-20!;Not:C34($required);"Date4")
$countErr:=$countErr+1
ASSERT:C1129($validator.errors.length=$countErr)
ASSERT:C1129($validator.warnings.length=$countWarn)
ASSERT:C1129($validator.errors[$validator.errors.length-1].type="Date4")

//--------------------------------------------------------------------



$validator.showMessages()