Class constructor
	This:C1470.$schema:="http://json-schema.org/draft-04/schema#"
	This:C1470.title:=OB Class:C1730(This:C1470).name
	This:C1470.type:="object"
	This:C1470.properties:=New object:C1471()
	This:C1470.required:=New collection:C1472()
	
	// This.definitions:=New object("function"; New object("call"; "object"))
	This:C1470.definitions:=New object:C1471("function"; New object:C1471("call"; "object"; "properties"; New object:C1471("call"; New object:C1471("type"; "object"))))
	
	ps[This:C1470.title]:=This:C1470  // register instance
	
	/// add a property to check
Function addProperty($name : Text; $type : Integer)
	This:C1470.properties[$name]:=New object:C1471("type"; This:C1470._type($type))
	This:C1470.required.push($name)
	
Function addOptionnalProperty($name : Text; $type : Integer)
	This:C1470.properties[$name]:=New object:C1471("type"; This:C1470._type($type))
	
Function addFunction($name : Text)
	This:C1470.properties[$name]:=New object:C1471("$ref"; "#/definitions/function")  // xxx check if call() exist
	This:C1470.required.push($name)
	
Function isInstance($obj : Object)->$match : Boolean
	$match:=JSON Validate:C1456($obj; This:C1470).success
	
Function assertedInstance($obj : Object)->$match : Boolean
	var $res : Object
	$res:=JSON Validate:C1456($obj; This:C1470)
	If (Not:C34($res.success))
		ASSERT:C1129(False:C215; JSON Stringify:C1217($res.errors))
	End if 
	$match:=$res.success
	
/*Function couldBeImplementedBy($class : 4D.Class)->$match : Boolean
// only function are tested, property are not set or declared and blocked
$match:=JSON Validate($class.XXXGetPrototypeFunctionsT_T; This._functionSchema()).success*/
	
Function _type($type : Integer)->$schemaType : Text
	var $types : Object
	$types:=New object:C1471(\
		String:C10(Is longint:K8:6); "integer"; \
		String:C10(Is text:K8:3); "string"; \
		String:C10(Is collection:K8:32); "array"; \
		String:C10(Is object:K8:27); "object"; \
		String:C10(Is null:K8:31); "null"; \
		String:C10(Is real:K8:4); "number"; \
		String:C10(Is boolean:K8:9); "boolean")  // OPTI must cache this
	
	$schemaType:=$types[String:C10($type)]
	
Function _functionSchema()->$schema : Object
	$schema:=OB Copy:C1225(This:C1470)
	var $p : Text
	For each ($p; $schema.properties)
		Case of 
			: ($schema.properties[$p]["$ref"]=Null:C1517)
				OB REMOVE:C1226($schema.properties; $p)
			Else 
				// XXX could check if "#/definitions/function" also
		End case 
	End for each 
	
Function defaultImplementation($instance : Object)
	var $required : Text
	For each ($required; This:C1470.required)
		If ($instance[$required]=Null:C1517)
			var $property : Variant
			$property:=This:C1470.properties[$required]
			Case of 
				: (String:C10($property.$ref)="#/definitions/function")
					
					$instance[$required]:=This:C1470[$required]  // copy function
				: (String:C10($property.call)="object")
					
					$instance[$required]:=This:C1470[$required]  // copy function
					
				: (Length:C16(String:C10($property.type))>0)
					
					$instance[$required]:=This:C1470[$required]  // copy default data
					
				Else 
					
			End case 
		End if 
	End for each 