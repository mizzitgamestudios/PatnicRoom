extends Cond_Parent
class_name Cond_Water_Wet

	
func _init(levelPara:int, durationPara:int) -> void:
	self.level                                        = levelPara
	self.duration                                     = durationPara
	#self.conditionSymbiotic["Elemental_Fire_Burning"] =  I_1_Binary_Comparison.new("Elemental_Fire_Burning","Elemental_Water_Wet","Elemental_ater_Wet")

	

func attachToEntWithClassName(ent): attachToEnt(ent,"Elemental_Water_Wet")
func indexName_quack():      return "Elemental_Water_Wet"
static func textureID_quack():      return "Conditions_0_1"



func isNeutraliced() -> bool:
	return false

func run():
	pass




static func getDoc():
	return {
		
		"keyword"          : "U_MOVE_USER",
		"name"             : "Move User",

		"unit"             : "EFFECT",    
		"stat"             : "STAT_MOD",

		"toString"         : "WIP",

		"inputModule"      : "VOID"

	}
