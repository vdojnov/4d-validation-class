//Class: ValidationClass
Class constructor
	This:C1470.errors:=New collection:C1472
	This:C1470.warnings:=New collection:C1472
	
Function validateEmail
	//isValidEmail(Email, isRequired, Type(Optional))
	var $1,$input,$3,$type,$regex : Text
	var $regexResult,$0,$2,$isRequired,$result : Boolean
	$input:=$1
	$isRequired:=$2
	If (Count parameters:C259=3)
		$type:=$3
	Else 
		$type:="Email"  // Default Type
	End if 
	
	$regex:="(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4"+"][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
	$regexResult:=This:C1470.validateRegex($input;$regex)
	This:C1470.addMessage($input;$regexResult;$type;$isRequired)
	$0:=$result
	
Function validatePhoneNumber
	//isValidPhoneNumber(PhoneNumber, isRequired, Type(Optional))
	var $1,$input,$3,$type,$regex : Text
	var $regexResult,$0,$2,$isRequired,$result : Boolean
	$input:=$1
	$isRequired:=$2
	If (Count parameters:C259=3)
		$type:=$3
	Else 
		$type:="Phone"  // Default Type
	End if 
	$regex:="^(?:\\+\\d{1,3}|0\\d{1,3}|00\\d{1,2})?(?:\\s?\\(\\d+\\))?(?:[-\\/\\s.]|\\d)+$"
	$regexResult:=This:C1470.validateRegex($input;$regex)
	This:C1470.addMessage($input;$regexResult;$type;$isRequired)
	$0:=$result
	
Function validateName
	//validateName(Name, isRequired, Type(Optional))
	var $1,$input,$3,$type,$regex : Text
	var $regexResult,$0,$2,$isRequired,$result : Boolean
	$input:=$1
	$isRequired:=$2
	If (Count parameters:C259=3)
		$type:=$3
	Else 
		$type:="Name"
	End if 
	
	$regex:="^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"
	$regexResult:=This:C1470.validateRegex($input;$regex)
	This:C1470.addMessage($input;$regexResult;$type;$isRequired)
	$0:=$result
	
Function validateIfNumBetween  // Number, date, and time
	//validateNumberBetween(Input, fromValue, toValue, isRequired, Type)
	var $1,$input,$2,$from,$3,$to : Real
	var $4,$isRequired,$0,$result,$sameType : Boolean
	var $5,$type : Text
	
	Case of 
		: (Count parameters:C259=5)
			$input:=$1
			$from:=$2
			$to:=$3
			$isRequired:=$4
			$type:=$5
	End case 
	
	If (($input>=$from) & ($input<=$to))
		$result:=True:C214
	Else 
		$result:=False:C215
	End if 
	
	This:C1470.addBetweenMessage(String:C10($input);String:C10($from);String:C10($to);$result;$type;$isRequired)
	$0:=$result
	
Function validateIfDateBetween  // Number, date, and time
	//validateNumberBetween(Input, fromValue, toValue, isRequired, Type)
	var $1,$input,$2,$from,$3,$to : Date
	var $4,$isRequired,$0,$result,$sameType : Boolean
	var $5,$type : Text
	
	Case of 
		: (Count parameters:C259=5)
			$input:=$1
			$from:=$2
			$to:=$3
			$isRequired:=$4
			$type:=$5
	End case 
	
	If (($input>=$from) & ($input<=$to))
		$result:=True:C214
	Else 
		$result:=False:C215
	End if 
	
	This:C1470.addBetweenMessage(String:C10($input);String:C10($from);String:C10($to);$result;$type;$isRequired)
	$0:=$result
	
Function isNotBlank
	var $1,$input : Text
	var $result,$0 : Boolean
	$input:=$1
	
	If (($input="") | ($input=Null:C1517) | ($input="!00-00-00!") | ($input="00/00/00") | (Undefined:C82($input)))
		$result:=False:C215
	Else 
		$result:=True:C214
	End if 
	$0:=$result
	
Function validateRegex
	var $1,$2,$regex,$input : Text
	var $result,$0 : Boolean
	$input:=$1
	$regex:=$2
	$result:=Match regex:C1019($regex;$input)
	$0:=$result
	
Function addMessage
	//addMessage($input;$regexResult;$type; $isRequired)
	var $1,$input,$3,$type : Text
	var $2,$regexResult,$4,$isRequired : Boolean
	$input:=$1
	$regexResult:=$2
	$type:=$3
	$isRequired:=$4
	
	If ($isRequired)
		Case of 
			: (This:C1470.isNotBlank($input)=False:C215)
				This:C1470.addError("Field can not be empty";$type)
			: ($regexResult=False:C215)
				This:C1470.addError("Field not Entered Correctly";$type)
		End case 
	Else 
		Case of 
			: (This:C1470.isNotBlank($input)=False:C215)
				This:C1470.addWarning("Field was left empty";$type)
			: ($regexResult=False:C215)
				This:C1470.addError("Field not Entered Correctly";$type)
		End case 
	End if 
	
Function addBetweenMessage
	var $1,$input,$2,$from,$3,$to : Variant
	var $5,$type : Text
	var $4,$result,$6,$isRequired,$7 : Boolean
	$input:=$1
	$from:=$2
	$to:=$3
	$result:=$4
	$type:=$5
	$isRequired:=$6
	
	
	If ($isRequired)
		Case of 
			: (This:C1470.isNotBlank($input)=False:C215)
				This:C1470.addError("Field can not be empty";$type)
			: ($result=False:C215)
				This:C1470.addError("Not between "+$from+" and "+$to;$type)
		End case 
	Else 
		Case of 
			: (This:C1470.isNotBlank($input)=False:C215)
				This:C1470.addWarning("Field was left empty";$type)
			: ($result=False:C215)
				This:C1470.addError("Not between "+String:C10($from)+" and "+String:C10($to);$type)
		End case 
	End if 
	
Function addError
	var $errObj : Object
	var $1,$2 : Text
	$errObj:=New object:C1471
	$errObj.message:=$1
	$errObj.type:=$2
	This:C1470.errors.push($errObj)
	
Function addWarning
	var $warnObj : Object
	var $1,$2 : Text
	$warnObj:=New object:C1471
	$warnObj.message:=$1
	$warnObj.type:=$2
	This:C1470.warnings.push($warnObj)
	
	
Function alertErrors
	var $alertMessage : Text
	var $message : Object
	
	$alertMessage:="Error! \n"
	If (This:C1470.errors.length>0)
		For each ($message;This:C1470.errors)
			$alertMessage:=$alertMessage+String:C10($message.type)+" "+String:C10($message.message)
			$alertMessage:=$alertMessage+"\n"
			//alert($a)
		End for each 
		ALERT:C41($alertMessage)
	End if 
	
Function alertWarnings
	var $alertMessage : Text
	var $message : Object
	
	$alertMessage:="Warning! \n"
	If (This:C1470.warnings.length>0)
		For each ($message;This:C1470.warnings)
			$alertMessage:=$alertMessage+String:C10($message.type)+" "+String:C10($message.message)
			$alertMessage:=$alertMessage+"\n"
			//alert($a)
		End for each 
		ALERT:C41($alertMessage)
	End if 
	
Function showMessages
	This:C1470.alertErrors()
	This:C1470.alertWarnings()
	
	