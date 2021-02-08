###############################################################################################################################
#                                                                                                                             #
# Klasse:		Entity                                                                                                        #
# description:	Container for Components                                              #
#                                                                                                                             #
# data flow:	SokraTiles -> PanicMode -> Actor Layor                                                                        #
# often called:	N/A                                                                                                           #
#                                                                                                                             #
###############################################################################################################################

extends Object
class_name Entity




########################
# --- Variables ------ #
########################
var dictOfTemplates: Dictionary ={}
var dictOfComps: Dictionary = {} 

########################
# --- Getter --------- #
########################
func getComponent(componentName:String):
	if hasComponent(componentName.to_lower()):
		return instance_from_id(dictOfComps[componentName.to_lower()])
	return null


func getComponentOfTemplate(templateName:String, componentname:String):
	var instanceID = dictOfTemplates[templateName]
	var instance = instance_from_id(instanceID)
	
	instanceID = instance.dictOfComps[componentname.to_lower()]
	instance = instance_from_id(instanceID)
	return instance

func getComponentValueOfTemplate(templateName:String, componentname:String):
	return getComponentOfTemplate(templateName,componentname).value


	
########################
# --- Setter --------- #
########################
func add_component(component:Component) -> void:
	#DemokrECTS.performanceManager.is_dirty = true
	dictOfComps[component.toString()] = component.get_instance_id()
	
func remove_component(componentName:String) -> void:
	#DemokrECTS.performanceManager.is_dirty = true
	if hasComponent( componentName.to_lower() ):
		dictOfComps.erase(componentName.to_lower())	


func addTemplate(templateName:String, ent:Entity):
	dictOfTemplates[templateName] = ent.get_instance_id()		



########################
# --- Validators ----- #
########################
func hasComponent(component_name:String) -> bool:
	var saniticedComp = component_name.to_lower()
	return self.dictOfComps.has(saniticedComp)

