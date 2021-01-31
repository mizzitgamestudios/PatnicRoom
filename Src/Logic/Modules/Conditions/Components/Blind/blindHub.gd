###############################################################################################################################
#                                                                                                                             #
# Klasse:		Blind Hub                                                                                                     #
# description:	Basic class for Tilemap representation,includes Signal for broadcasts                                         #
#                                                                                                                             #
# data flow:	                                                                                                              #
# often called:	N/A                                                                                                           #
#                                                                                                                             #
###############################################################################################################################
extends Component
class_name Comp_Cond_Blind


########################
# --- Variables ------ #
########################
var duration: int
var intensity: int
var strategy: String
var affectedEnt: Entity



########################
# --- Init ----------- #
########################
func _init(parentPara:Entity, durationPara:int, intensityPara:int, strategyPara:String) -> void:
	
	name = "Comp_Cond_Blind"
	
	duration = durationPara + 1
	intensity = intensityPara
	strategy = strategyPara
	
	connect("Actor_Turn_Started",self,"_on_Actor_Turn_Started")
	connect("Actor_Turn_Finished",self,"_on_Actor_Turn_Finished")


########################
# --- Process -------- #
########################
func run():
	getStrategyOfCondition(self)


func getStrategyOfCondition(instancedCondition:Component) -> void:
	match instancedCondition.strategy:
		"noStimulation":
			noStimulation.run(instancedCondition)
		"overStimulation":
			overStimulation.run(instancedCondition)


func isWornOut() -> bool:
	return duration == 0
func isNeutraliced() -> bool:
	return false


func _on_Actor_Turn_Started():
	if isWornOut():
		affectedEnt.remove_component(name)
		
func _on_Actor_Turn_Finished():
	if !isNeutraliced(): 
		run()
		duration -= 1   
	
	else:
		affectedEnt.remove_component(name)  



########################
# --- Files ---------- #
########################
var noStimulation = preload("res://Src/Logic/Modules/Conditions/Components/Blind/Strategies/noStimulation.gd")
var overStimulation = preload("res://Src/Logic/Modules/Conditions/Components/Blind/Strategies/overStimulation.gd")
