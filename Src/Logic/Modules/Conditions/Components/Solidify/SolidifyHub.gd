extends Component
class_name Comp_Cond_Solidify

var duration: int
var intensity: int
var strategy: String
var affectedEnt: Entity

func _init(parentPara:Entity, durationPara:int, intensityPara:int, strategyPara:String) -> void:
	connect("Actor_Turn_Started",self,"_on_Actor_Turn_Started")
	connect("Actor_Turn_Finished",self,"_on_Actor_Turn_Finished")
	
	name = "Comp_Cond_Solidify"
	
	duration = durationPara + 1
	intensity = intensityPara
	strategy = strategyPara



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


var foo = preload("res://Src/Logic/Modules/Conditions/Components/Solidify/Strategies/bar.gd")
var bar = preload("res://Src/Logic/Modules/Conditions/Components/Solidify/Strategies/foo.gd")
