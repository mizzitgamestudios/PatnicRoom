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
	self.textureID = "Conditions_0_0"
	self.indexName = "Elemental_Fire_Burning"
	
	self.logToString = "placeholder dummy lorem ipsum"
	
	self.symbioticComponents = {
		"Placeholder dummy":"lorem ipsum"
		
	}

	var arr1 = ["Cond_Burning_Root"]
	self.conditionSymbiotic = {
		 "Elemental_Fire_Burning" : IC_1_FOO
	}



static func textureID_quack():
	return "Conditions_0_0"


func getLogToSTring():
	return self.logToString


func isNeutraliced() -> bool:
	return false



func run():
	if affectedEnt is ActorEntity:
		DIOJSONES_UNIQUE_STATMOD.manageUniqueStatmod(affectedEnt, "U_DEAL_PLAIN_DAMAGE", level)
	
	if affectedEnt.textureID() == "Suburban_0_1":
		var ent = SokraTiles.getMeatFloor().getEntByPos_quack(int(affectedEnt.pos().x-1),affectedEnt.pos().y+1)
		if ent.textureID() == "Suburban_0_1" and !ent.dictOfConds.has(self.textureID):
			API_003_Condition.attachConditionToEnt(ent, self.indexName, self.duration, self.level)

