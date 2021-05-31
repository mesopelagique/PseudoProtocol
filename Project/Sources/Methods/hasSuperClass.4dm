//%attributes = {}
#DECLARE($class : 4D:C1709.Class; $className : Text)->$has : Boolean

var $superclass : 4D:C1709.Class

$superclass:=$class
$has:=False:C215
Repeat 
	$superclass:=$superclass.superclass
	$has:=$superclass.name=$className
Until ($has | ($superclass.name="Object"))
