###############################################################################################################################
#                                                                                                                             #
# Klasse:		PerformanceManager                                                                                            #
# description:	increases Framerate and empties unused but reserved memory space                                              #
#                                                                                                                             #
# data flow:	SokraTiles -> PanicMode -> Actor Layor                                                                        #
# often called:	N/A                                                                                                           #
#                                                                                                                             #
###############################################################################################################################

extends Node
class_name PerformanceManager         

################################################################################
##  --- Management ---                                                        ##
################################################################################
var is_dirty: bool = false;
var do_clean: bool = false;




# rebuild system entities
#
# we do not force a build or rebuild of the
# system filters, instead we make the developer
# do it
#
# this will improve performance when adding and
# removing entities and components at runtime
func clean() -> void:
	do_clean = true
	
func _exit_tree() -> void:
	clean()
	
func rebuild() -> void:
	DemokrECTS.systemManager.system_entities.clear()
	for _system in DemokrECTS.systemManager.systems:
		if DemokrECTS.systemManager.systems[_system].enabled:
			DemokrECTS.systemManager._add_system_entities(_system)
	
	is_dirty = false




########################
##  --- Management --- #
########################
func update(group = null, delta = null) -> void:
	if is_dirty:
		rebuild()
	
	if not delta:
		delta = get_process_delta_time()
	
	var _delta = delta
	
	# if no group passed, do all systems
	if not group:
		for _system in DemokrECTS.systemManager.values():
			if _system.enabled:
				DemokrECTS.systemManager._system.on_process(DemokrECTS.systemManager.system_entities[_system.name.to_lower()], _delta)
	
	# process each system in this group group
	if (DemokrECTS.groupManager.group && DemokrECTS.groupManager.group_systems.has(group)):
		for _system_name in DemokrECTS.systemManager.group_systems[group]:
			var _system = DemokrECTS.systemManager.systems[_system_name]
			if _system.enabled:
				_system.on_process(DemokrECTS.systemManager.system_entities[DemokrECTS.systemManager._system.name.to_lower()], _delta)
	
	# clean up entities queued for removal
	if DemokrECTS.entityManager.entity_remove_queue.size() > 0:
		is_dirty = true
		for _entity_id in DemokrECTS.entityManager.entity_remove_queue:
			if  DemokrECTS.entities.has(_entity_id):
				 DemokrECTS.entities[_entity_id].queue_free()
				 DemokrECTS.entities.erase(_entity_id)
	
	# and clear the queue
	DemokrECTS.entityManager.entity_remove_queue.clear()
	
	# full cleaning requested?
	if (do_clean):
		
		DemokrECTS.entities.clear()
		DemokrECTS.entityManager.EntittiesWithComponents.clear()
		DemokrECTS.systemManager.systems.clear()
		DemokrECTS.systemManager.system_components.clear()
		DemokrECTS.systemManager.system_entities.clear()
		DemokrECTS.groupManager.groups.clear()
		DemokrECTS.groupManager.group_systems.clear()
		DemokrECTS.entityManager.entity_remove_queue.clear()
		do_clean = false
	
	return
