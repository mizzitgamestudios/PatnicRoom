extends Control

var boolean:bool
func _init() -> void:
	Signals.connect("sendInstToAddAsChild",self,"sendFeedback")

var cachedNode: Node


func getSidePanel():
	return cachedNode

func sendFeedback(insatnceToAdd):
	return self

