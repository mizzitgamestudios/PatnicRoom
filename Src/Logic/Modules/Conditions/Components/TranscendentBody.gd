extends Component
class_name Comp_Cond_TranscendentBody

var duration: int
var affectedEnt: Entity 

func _init(parentPara:Entity, durationPara:int) -> void:  
	connect("Actor_Turn_Started",self,"_on_Actor_Turn_Started")
	connect("Actor_Turn_Finished",self,"_on_Actor_Turn_Finished")
	
	name = "Comp_Cond_TranscendentBody"
	
	duration = durationPara
	affectedEnt = parentPara



func run(): 
	pass



func logEvent() -> void:  
	pass

func getLogToString(numberPara:int) -> String:                
	var toString: String = ""
	
	match numberPara:
		1:
			toString+" "
		2:
			toString+" "
		3:
			toString+" "
	
	return toString



func isWornOut() -> bool:
	return duration == 0
func isNeutraliced() -> bool:                                                   
	return false



func _on_Actor_Turn_Started():
	if isWornOut():
		affectedEnt.remove_component(name)

func _on_Actor_Turn_Finished():
	if !isNeutraliced(): 
		logEvent()
		run()
		duration -= 1   
	
	else:
		affectedEnt.remove_component(name)  



