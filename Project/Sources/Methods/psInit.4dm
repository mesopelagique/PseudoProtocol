//%attributes = {}

ps:=New object:C1471()
var $key : Text
For each ($key; cs:C1710)
	var $class : 4D:C1709.Class
	$class:=cs:C1710[$key]
	If (hasSuperClass($class; "Protocol"))
		$class.new()
	End if 
End for each 