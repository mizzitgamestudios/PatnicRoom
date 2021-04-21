################################################################################
#   Name:         Burning (Root)                                               #
#   Requirements: N/A                                                          #
#   Mechanic:     Deals 1W*level* damage                                       #
#                                                                              #
#                                                                              #
################################################################################
extends Cond_Parent
class_name Cond_Confusing_Wandering


func _ready(level:int, duration:int) -> void:
	self.level = level
	self.duration = duration
	
	
	self.logToString = "placeholder dummy lorem ipsum"
	
	self.symbioticComponents = {
		"Placeholder dummy":"lorem ipsum"
	}



func getLogToSTring():
	return self.logToString


func isNeutraliced() -> bool:
	return false




func run():
	pass
