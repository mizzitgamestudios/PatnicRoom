extends ComponentBasic
class_name Component



################################################################################
##  --- Variables ---                                                         ##
################################################################################

func getAllEntititiesWithComp(component_name:String) -> Dictionary:
	return DemokrECTS.entityManager.EntittiesWithComponents[component_name]

func getAllComponents() -> Dictionary:
	return EntittiesWithComponents

func hasComponent(component_name:String) -> bool:
	return EntittiesWithComponents.has(component_name)






