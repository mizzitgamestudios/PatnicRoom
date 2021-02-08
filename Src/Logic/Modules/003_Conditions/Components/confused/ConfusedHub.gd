###############################################################################################################################
#                                                                                                                             #
# Klasse:		TileEntity                                                                                                    #
# description:	Basic class for Tilemap representation,includes Signal for broadcasts                                         #
#                                                                                                                             #
# data flow:	                                                                                                              #
# often called:	N/A                                                                                                           #
#                                                                                                                             #
###############################################################################################################################

extends Component
class_name Comp_Cond_Confused


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
	connect("Actor_Turn_Started",self,"_on_Actor_Turn_Started")
	connect("Actor_Turn_Finished",self,"_on_Actor_Turn_Finished")
	
	name = "Comp_Cond_Confused"
	
	duration = durationPara + 1
	intensity = intensityPara
	strategy = strategyPara


########################
# --- Process -------- #
########################
func run():
	getStrategyOfCondition(self)


func getStrategyOfCondition(instancedCondition:Component) -> void:
	match instancedCondition.strategy:
		"noStimulation":
			pass


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
# --- File ----------- #
########################
var foo = load("res://Src/Logic/Modules/003_Conditions/Components/confused/Strategies/bar.gd")
var bar = load("res://Src/Logic/Modules/003_Conditions/Components/confused/Strategies/foo.gd")
