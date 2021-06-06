//%attributes = {}
// declare one time my service
declareProtocols


// then work
var $instance : Object
$instance:=cs:C1710.ServiceGithub.new()

ASSERT:C1129(ps.ServiceProtocol.isInstance($instance); "Not a service")

If (ps.ServiceProtocol.assertedInstance($instance))
	// do something
End if 

// ASSERT(is.ServiceInterface.couldBeImplementedBy(cs.github))

ASSERT:C1129(Not:C34(ps.MySecondProtocol.isInstance($instance)); "Must not be a MySecondProtocol")

//-----------------------//

ASSERT:C1129(Not:C34(ps.ServiceProtocol.isInstance(New object:C1471())); "Must not be a service")


//-----------------------//
// an object that take default implementation from protocol default definition
ASSERT:C1129(cs:C1710.WillBeService.new().getRepository#Null:C1517)