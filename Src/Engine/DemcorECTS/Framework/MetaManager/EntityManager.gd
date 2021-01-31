###############################################################################################################################
#                                                                                                                             #
# Klasse:		EntityManager                                                                                                   #
# description:	List of all Actors on @SokraTiles.Atlas_tileset_Meta on ActorLayor                                            #
#                                                                                                                             #
# data flow:	SokraTiles -> PanicMode -> Actor Layor                                                                        #
# often called:	N/A                                                                                                           #
#                                                                                                                             #
###############################################################################################################################

extends Node
class_name EntityManager

################################################################################
##  --- Variablen ---                                                         ##
################################################################################

var entities = {};                                                              # scene entities
var EntittiesWithComponents = {};                                               # entities with a component    
var entity_remove_queue = [];                                                   #gets remove post group processing


################################################################################
##  --- Management ---                                                        ##
################################################################################

func add_entity(entity:Entity) -> void:
	DemokrECTS.performanceManager.is_dirty = true;
	var _id: int = entity.get_instance_id();
	var _name: String = entity.name;
	
	# warn if trying to use same instance_id and exit
	if entity.isEntityInECS(_id):
		Logger.warn("- entity %s already exists, skipping");
	
	
	# turn off normal godot processing
	entity.set_process(false);
	entity.set_physics_process(false);
	entity.set_process_input(false);
	
	# call on_before_add if available
	if entity.has_method("on_before_add"):
		entity.on_before_add();
	
	# add the entity node reference using its instance_id as key
	DemokrECTS.entityManager.entities[_id] = entity;
	
	# call on_after_add if available
	if entity.has_method("on_after_add"):
		entity.on_after_add();


func removeEntityInECS(entity:Entity) -> void:#
	if (entity.has_method("get_instance_id")):
		DemokrECTS.entity_remove_queue.append(entity.get_instance_id());



################################################################################
##  --- System ---                                                            ##
################################################################################

func _add_system_entities(system_name):
	var _entities = []
	
	for entity_id in entities:
		if not entities[entity_id].enabled:
			continue
		
		var has_all_components: bool = true
		
		for component in  DemokrECTS.systemManager.system_components[system_name]:
		
			if component.substr(0,1) == "!":
				var _component_id: String = component.substr(1,999)
				if (hasComponent(_component_id)):
					if EntittiesWithComponents[_component_id].has(entity_id):
						has_all_components = false
						break
					break
				break
				
			if not EntittiesWithComponents.has(component):
				has_all_components = false
				break
				
			if not EntittiesWithComponents[component].has(entity_id):
				has_all_components = false
				break
			
		if has_all_components:
			_entities.append(entities[entity_id])
		
	DemokrECTS.systemManager.system_entities[system_name] = _entities



################################################################################
##  --- Helpers / Validators ---                                              ##
################################################################################

func getAllEntititiesWithComp(component_name:String) -> Dictionary:
	return EntittiesWithComponents[component_name]

func getAllComponents() -> Dictionary:
	return EntittiesWithComponents

func hasComponent(component_name:String) -> bool:
	return EntittiesWithComponents.has(component_name)
