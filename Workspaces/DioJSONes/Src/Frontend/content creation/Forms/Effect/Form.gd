extends Node


var space
var effect
var trigger


func initialice() -> void:
	space          = get_node("Space")
	effect         = get_node("Effect")
	trigger        = get_node("Trigger")
	
	space.setUpNodeReferences()
	effect.setUpNodeReferences()
	trigger.setUpNodeReferences()



func getSlot():
	var effectCache = EffectCache.new()
	
	effectCache.scene = self
	effectCache     = space.getUnits(effectCache)
	effectCache     = trigger.getUnits(effectCache)
	effectCache     = effect.getUnits(effectCache)
	
	return effectCache


