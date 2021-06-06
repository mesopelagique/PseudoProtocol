Class extends Protocol

Class constructor
	Super:C1705()
	This:C1470.description:="Service that allow request"
	This:C1470.addProperty("name"; Is text:K8:3)
	This:C1470.addFunction("getRepository")
	
	This:C1470.name:="default"
	
Function getRepository
	ASSERT:C1129(False:C215; "must be implemented")