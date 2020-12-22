//Class: ValidationClass

//TODO: 
//1. Check if input is undefined If(undefined)-> addmessage, Else -> go through validation process. This needs to be done for each validation function


Class constructor
	This.errors:=New collection
	This.warnings:=New collection
	This.allFeilds:=New collection
	
Function validateEmail
	//isValidEmail(Email, isRequired, Type(Optional))
	var $1,$input,$3,$type,$regex : Text
	var $regexResult,$0,$2,$isRequired,$result : Boolean
	$input:=$1
	$isRequired:=$2
	
	If (Count parameters=3)
		$type:=$3
	Else 
		$type:="Email"  // Default Type
	End if 
	
	$regex:="(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4"+"][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
	$regexResult:=This.validateRegex($input;$regex)
	This.addMessage($input;$regexResult;$type;$isRequired)
	$0:=$regexResult
	
Function validatePhoneNumber
	//isValidPhoneNumber(PhoneNumber, isRequired, Type(Optional))
	var $1,$input,$3,$type,$regex : Text
	var $regexResult,$0,$2,$isRequired,$result : Boolean
	$input:=$1
	$isRequired:=$2
	If (Count parameters=3)
		$type:=$3
	Else 
		$type:="Phone"  // Default Type
	End if 
	$regex:="^(?:\\+\\d{1,3}|0\\d{1,3}|00\\d{1,2})?(?:\\s?\\(\\d+\\))?(?:[-\\/\\s.]|\\d)+$"
	$regexResult:=This.validateRegex($input;$regex)
	This.addMessage($input;$regexResult;$type;$isRequired)
	$0:=$regexResult
	
Function validateName
	//validateName(Name, isRequired, Type(Optional))
	var $1,$input,$3,$type,$regex : Text
	var $regexResult,$0,$2,$isRequired,$result : Boolean
	$input:=$1
	$isRequired:=$2
	If (Count parameters=3)
		$type:=$3
	Else 
		$type:="Name"
	End if 
	
	$regex:="^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"
	$regexResult:=This.validateRegex($input;$regex)
	This.addMessage($input;$regexResult;$type;$isRequired)
	$0:=$regexResult
	
Function validateIfNumBetween  // Number, date, and time
	//validateNumberBetween(Input, fromValue, toValue, isRequired, Type)
	var $1,$input,$2,$from,$3,$to : Real
	var $4,$isRequired,$0,$result,$sameType : Boolean
	var $5,$type : Text
	
	Case of 
		: (Count parameters=4)
			$input:=$1
			$from:=$2
			$to:=$3
			$isRequired:=$4
			$type:="Number"
		: (Count parameters=5)
			$input:=$1
			$from:=$2
			$to:=$3
			$isRequired:=$4
			$type:=$5
	End case 
	
	If (($input>=$from) & ($input<=$to))
		$result:=True
	Else 
		$result:=False
	End if 
	
	This.addBetweenMessage(String($input);String($from);String($to);$result;$type;$isRequired)
	$0:=$result
	
Function validateIfDateBetween  // Number, date, and time
	//validateNumberBetween(Input, fromValue, toValue, isRequired, Type)
	var $1,$input,$2,$from,$3,$to : Date
	var $4,$isRequired,$0,$result,$sameType : Boolean
	var $5,$type : Text
	
	Case of 
		: (Count parameters=4)
			$input:=$1
			$from:=$2
			$to:=$3
			$isRequired:=$4
			$type:="Date"
		: (Count parameters=5)
			$input:=$1
			$from:=$2
			$to:=$3
			$isRequired:=$4
			$type:=$5
	End case 
	
	If (($input>=$from) & ($input<=$to))
		$result:=True
	Else 
		$result:=False
	End if 
	
	This.addBetweenMessage(String($input);String($from);String($to);$result;$type;$isRequired)
	$0:=$result
	
Function isNotBlank
	var $1,$input : Text
	var $result,$0 : Boolean
	$input:=$1
	
	If (($input="") | ($input=Null) | ($input="!00-00-00!") | ($input="00/00/00") | (Undefined($input)))
		$result:=False
	Else 
		$result:=True
	End if 
	$0:=$result
	
Function validateRegex
	var $1,$2,$regex,$input : Text
	var $result,$0 : Boolean
	$input:=$1
	$regex:=$2
	$result:=Match regex($regex;$input)
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
			: (This.isNotBlank($input)=False)
				This.addError("Field can not be empty";$type)
			: ($regexResult=False)
				This.addError("Field not Entered Correctly";$type)
		End case 
	Else 
		Case of 
			: (This.isNotBlank($input)=False)
				This.addWarning("Field was left empty";$type)
			: ($regexResult=False)
				This.addError("Field not Entered Correctly";$type)
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
			: (This.isNotBlank($input)=False)
				This.addError("Field can not be empty";$type)
			: ($result=False)
				This.addError("Not between "+$from+" and "+$to;$type)
		End case 
	Else 
		Case of 
			: (This.isNotBlank($input)=False)
				This.addWarning("Field was left empty";$type)
			: ($result=False)
				This.addError("Not between "+String($from)+" and "+String($to);$type)
		End case 
	End if 
	
Function addError
	var $errObj : Object
	var $1,$2 : Text
	$errObj:=New object
	$errObj.message:=$1
	$errObj.type:=$2
	This.errors.push($errObj)
	
Function addWarning
	var $warnObj : Object
	var $1,$2 : Text
	$warnObj:=New object
	$warnObj.message:=$1
	$warnObj.type:=$2
	This.warnings.push($warnObj)
	
	
Function alertErrors
	var $alertMessage : Text
	var $message : Object
	
	$alertMessage:="Error! \n"
	If (This.errors.length>0)
		For each ($message;This.errors)
			$alertMessage:=$alertMessage+String($message.type)+" "+String($message.message)
			$alertMessage:=$alertMessage+"\n"
			//alert($a)
		End for each 
		ALERT($alertMessage)
	End if 
	
Function alertWarnings
	var $alertMessage : Text
	var $message : Object
	
	$alertMessage:="Warning! \n"
	If (This.warnings.length>0)
		For each ($message;This.warnings)
			$alertMessage:=$alertMessage+String($message.type)+" "+String($message.message)
			$alertMessage:=$alertMessage+"\n"
		End for each 
		CONFIRM($alertMessage;"Continue";"Go Back")
	End if 
	
Function showMessages
	If (This.errors.length=0)
		This.alertWarnings()
	Else 
		This.alertErrors()
	End if 
	
Function addMandatory
	var $1,$2,$3 : Text
	var $obj : Object
	
	$obj:=New object
	
	$obj.isRequired:=True
	
	Case of 
		: (Count parameters=2)
			$obj.validateFor:=$1
			$obj.value:=$2
			$obj.customType:=False
		: (Count parameters=3)
			$obj.validateFor:=$1
			$obj.value:=$2
			$obj.type:=$3
			$obj.customType:=True
		: (Count parameters=4)
			$obj.validateFor:=$1
			$obj.value:=$2
			$obj.from:=$3
			$obj.to:=$4
			$obj.customType:=False
		: (Count parameters=5)
			$obj.validateFor:=$1
			$obj.value:=$2
			$obj.from:=$3
			$obj.to:=$4
			$obj.type:=$5
			$obj.customType:=True
	End case 
	
	This.allFeilds.push($obj)
	
Function addNotMandatory
	var $1,$2,$3 : Text
	var $obj : Object
	
	$obj:=New object
	
	$obj.isRequired:=False
	
	Case of 
		: (Count parameters=2)
			$obj.validateFor:=$1
			$obj.value:=$2
			$obj.customType:=False
		: (Count parameters=3)
			$obj.validateFor:=$1
			$obj.value:=$2
			$obj.type:=$3
			$obj.customType:=True
		: (Count parameters=4)
			$obj.validateFor:=$1
			$obj.value:=$2
			$obj.from:=$3
			$obj.to:=$4
			$obj.customType:=False
		: (Count parameters=5)
			$obj.validateFor:=$1
			$obj.value:=$2
			$obj.from:=$3
			$obj.to:=$4
			$obj.type:=$5
			$obj.customType:=True
	End case 
	
	This.allFeilds.push($obj)
	
Function validate
	var $fieldObj : Object
	
	For each ($fieldObj;This.allFeilds)
		This.validationLoop($fieldObj)
	End for each 
	
	
Function validationLoop
	var $fieldObj,$1 : Object
	$fieldObj:=$1
	
	Case of 
		: (Lowercase($fieldObj.validateFor)="email")
			
			If ($fieldObj.customType=True)
				This.validateEmail($fieldObj.value;$fieldObj.isRequired;$fieldObj.type)
			Else 
				This.validateEmail($fieldObj.value;$fieldObj.isRequired)
			End if 
			
		: (Lowercase($fieldObj.validateFor)="phonenumber")
			If ($fieldObj.customType=True)
				This.validatePhoneNumber($fieldObj.value;$fieldObj.isRequired;$fieldObj.type)
			Else 
				This.validatePhoneNumber($fieldObj.value;$fieldObj.isRequired)
			End if 
			
		: (Lowercase($fieldObj.validateFor)="Name")
			If ($fieldObj.customType=True)
				This.validateName($fieldObj.value;$fieldObj.isRequired;$field$fieldObj.type)
			Else 
				This.validateName($fieldObj.value;$fieldObj.isRequired)
			End if 
		: (Lowercase($fieldObj.validateFor)="numbetween")
			If ($fieldObj.customType=True)
				This.validateIfNumBetween($fieldObj.value;$fieldObj.from;$fieldObj.to;$fieldObj.isRequired;$fieldObj.type)
			Else 
				This.validateIfNumBetween($fieldObj.value;$fieldObj.from;$fieldObj.to;$fieldObj.isRequired)
			End if 
			
		: (Lowercase($fieldObj.validateFor)="datebetween")
			If ($fieldObj.customType=True)
				This.validateIfDateBetween($fieldObj.value;$fieldObj.from;$fieldObj.to;$fieldObj.isRequired;$fieldObj.type)
			Else 
				This.validateIfDateBetween($fieldObj.value;$fieldObj.from;$fieldObj.to;$fieldObj.isRequired)
			End if 
	End case 
	
	//confirm method
