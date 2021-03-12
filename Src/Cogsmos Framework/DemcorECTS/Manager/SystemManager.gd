extends Node
#//CLASS           Work In Porgress                                        
class_name SystemManager



# a system processes entities with certain components
var systems = {};
# the components filtered in a system
var system_components = {};
# the entities in a given system
var system_entities = {};




################################################################################
##  --- Management ---                                                        ##
################################################################################
func add_system(system, components = []) -> void:
	var _id: String = system.name.to_lower();
	
	if DemokrECTS.isSystemInECS(_id):
		return;
	
	# call on_before_add if available
	if system.has_method("on_before_add"):
		system.on_before_add();
	
	# add the system and create an empty list of component names
	systems[_id] = system;
	system_components[_id] = []
	
	# add the components to the system
	for _component in components:
		system_components[_id].append(_component.to_lower().strip_edges());
	
	# call on_after_add if available
	if system.has_method("on_after_add"):
		system.on_after_add();

		
func removeSystemInECS(system_name:String):
	var _id: String = system_name.to_lower();
	var _system = systems[system_name];
	
	if not isSystemInECS(_id):
		return;
	
	if _system.has_method("on_before_remove"):
		_system.on_before_remove();
	
	systems.erase(_id);
	system_components.erase(_id);
	
	if _system.has_method("on_after_remove"):
		_system.on_after_remove();

################################################################################
##  --- Helpers / Validators ---                                              ##
################################################################################

func isSystemInECS(system_name) -> bool:
	if systems.has(system_name):
		return true
	return false
