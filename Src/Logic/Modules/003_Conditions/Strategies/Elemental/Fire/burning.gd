################################################################################
#   Name:         Burning (Root)                                               #
#   Requirements: N/A                                                          #
#   Mechanic:     Deals 1W*level* damage                                       #
#                                                                              #
#                                                                              #
################################################################################
extends Cond_Parent
class_name Cond_Burning_Root


func _init(levelPara:int, durationPara:int) -> void:
	self.level = levelPara
	self.duration = durationPara
	self.isNeutraliced = false

	
	
	self.logToString = "placeholder dummy lorem ipsum"
	
	self.symbioticComponents = {
		"Placeholder dummy":"lorem ipsum"
		
	}

	var arr1 = ["Cond_Burning_Root"]
	self.conditionSymbiotic = {
		 "Elemental_Fire_Burning" : IC_1_FOO
	}



	



func getLogToSTring():
	return self.logToString


func isNeutraliced() -> bool:
	return false



func run():
	pass
