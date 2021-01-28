extends Node
class_name ComponentManager




func add_component(component:Component) -> String:
	DemokrECTS.performanceManager.is_dirty = true;
	var _id: String = component.name.to_lower();
	
	if (component.has_method('get_name')):
		_id = component.get_name().to_lower();
	
	if DemokrECTS.entityManager.hasComponent(_id):
		return _id;
	
	DemokrECTS.entityManager.EntittiesWithComponents[_id] = {}
	
	return _id;



func removeComponentInECS(entity:Entity, component_name:String) -> void:
	DemokrECTS.performanceManager.is_dirty = true;
	var _key: String = component_name.to_lower();
	
	if DemokrECTS.entityManager.hasComponent(_key):
		var _id = entity.get_instance_id();
		DemokrECTS.entityManager.EntittiesWithComponents[_key].erase(_id);
	return





