##########################################################################################################
##                                                                                                      ##
##                                                                                                      ##
##                                                                                                      ##
##                                                                                                      ##
##                                                                                                      ##
##                                                                                                      ##
##                                                                                                      ##
##########################################################################################################
class_name System
extends Node

################################################################################
##  --- Variables ---                                                         ##
################################################################################
export var COMPONENTS = ""
export var ENABLED = true
export var AWAKE = true

var components = ""
var enabled: bool = false
var awake: bool = false



################################################################################
##  --- Signals ---                                                           ##
################################################################################
func on_before_add() -> void:
	Logger.trace("[system] on_before_add")

func on_after_add() -> void:
	Logger.trace("[system] on_after_added")

func on_before_remove() -> void:
	Logger.trace("[system] on_before_remove")

func on_after_remove() -> void:
	Logger.trace("[system] on_after_remove")

func on_process(entities, delta) -> void:
	for entity in entities:
		on_process_entity(entity, delta)


func on_process_entity(entity, delta) -> void:
	Logger.trace("[system] on_process_entity")
	pass

func _ready() -> void:
	if COMPONENTS: components = COMPONENTS
	if ENABLED: enabled = ENABLED
	if AWAKE: awake = AWAKE

	var _components = components.to_lower().split(",")
	ECS.add_system(self, _components)
