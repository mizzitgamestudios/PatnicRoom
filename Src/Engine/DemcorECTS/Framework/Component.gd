extends Node
class_name ComponentBasic


################################################################################
##  --- Variables ---                                                         ##
################################################################################
var EntittiesWithComponents = {};



################################################################################
##  --- Variables ---                                                         ##
################################################################################

func add_component(component:ComponentBasic) -> String:
	DemokrECTS.is_dirty = true;
	var _id: String = component.name.to_lower();
	
	if (component.has_method('get_name')):
		_id = component.get_name().to_lower();
	
	if hasComponent(_id):
		return _id;
	
	DemokrECTS.EntittiesWithComponents[_id] = {}
	return _id;



func removeComponentInECS(entity, component_name:String) -> void:
	DemokrECTS.performanceManager.is_dirty = true;
	var _key: String = component_name.to_lower();
	
	if hasComponent(_key):
		var _id = entity.get_instance_id();
		EntittiesWithComponents[_key].erase(_id);




func getAllEntititiesWithComp(component_name:String) -> Dictionary:
	return DemokrECTS.EntittiesWithComponents[component_name]

func getAllComponents() -> Dictionary:
	return EntittiesWithComponents

func hasComponent(component_name:String) -> bool:
	return EntittiesWithComponents.has(component_name)






