extends Component
class_name Comp_Cond_Blind

var duration: int
var intensity: int
var strategy: String
var affectedEnt: Entity

func _init(parentPara:Entity, durationPara:int, intensityPara:int, strategyPara:String) -> void:
	connect("Actor_Turn_Started",self,"_on_Actor_Turn_Started")
	connect("Actor_Turn_Finished",self,"_on_Actor_Turn_Finished")
	
	name = "Comp_Cond_Blind"
	
	duration = durationPara + 1
	intensity = intensityPara
	strategy = strategyPara



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


var noStimulation = preload("res://Src/Logic/Modules/Conditions/Components/Blind/Strategies/noStimulation.gd")
var overStimulation = preload("res://Src/Logic/Modules/Conditions/Components/Blind/Strategies/overStimulation.gd")