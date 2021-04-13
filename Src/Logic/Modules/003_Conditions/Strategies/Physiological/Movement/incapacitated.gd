extends Cond_Parent
class_name Physiological_Movement_Incapacitated

	
func _init(levelPara:int, durationPara:int) -> void:
	self.level    = levelPara
	self.duration = durationPara

	


func attachToEntWithClassName(ent): attachToEnt(ent,"Physiological_Movement_Incapacitated")
func indexName_quack():      return "Physiological_Movement_Incapacitated"
static func textureID_quack():      return "Conditions_0_0"



func isNeutraliced() -> bool:
	return false


func run():
    pass


