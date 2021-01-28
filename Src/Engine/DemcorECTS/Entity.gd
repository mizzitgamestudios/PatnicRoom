extends Node
class_name Entity

################################################################################
##  --- Variables ---                                                         ##
################################################################################
var enabled: bool = true
var dictOfTemplates={}
var listOfComps=[]



################################################################################
##  --- Componenten ---                                                       ##
################################################################################

func getComponent(componentName:String) -> Component:
	var compNameToLower=componentName.to_lower()
	if hasComponent(compNameToLower):
		return DemokrECTS.entityManager.EntittiesWithComponents[compNameToLower][self.get_instance_id()]
	return compNameToLower+" not found"


func add_component(component) -> void:
	listOfComps.append(component.name)
	#DemokrECTS.performanceManager.is_dirty = true
	var _entity_id: int = self.get_instance_id()
	
	if not isEntityInECS(_entity_id):
		DemokrECTS.entityManager.add_entity(self)
	
	var _id = DemokrECTS.componentManager.add_component(component)
	
	DemokrECTS.entityManager.EntittiesWithComponents[_id][_entity_id] = component


func remove_component(component_name) -> void:
	DemokrECTS.performanceManager.is_dirty = true
	var _id: String = component_name.to_lower()
	
	if not DemokrECTS.isEntityInECS(self.get_instance_id()):
		return
	if not hasComponent(_id):
		return
		
	DemokrECTS.EntittiesWithComponents[_id].erase(component_name)



################################################################################
##  --- Template ---                                                          ##
################################################################################

func addTemplate(templateName:String, ent:Entity):
	dictOfTemplates[templateName]=ent

func getComponentValueOfTemplate(templateName:String, componentname:String):
	return dictOfTemplates[templateName].getComponent(componentname).value

func getComponentOfTemplate(templateName:String, componentname:String):
	return dictOfTemplates[templateName].getComponent(componentname)



################################################################################
##  --- Helpers / Validators ---                                              ##
################################################################################

func isEntityInECS(entity_id) -> bool:
	
	if  DemokrECTS.entityManager.entities.has(entity_id):
		return true
	return false

func hasComponent(component_name:String) -> bool:
	var saniticedComp = component_name.to_lower()
	if DemokrECTS.entityManager.EntittiesWithComponents.has(saniticedComp):
		if DemokrECTS.entityManager.EntittiesWithComponents[saniticedComp].has(self.get_instance_id()):
			return true
	return false




