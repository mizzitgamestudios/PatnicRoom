################################################################################
#   Name:         Burning (Root)                                               #
#   Requirements: N/A                                                          #
#   Mechanic:     Deals 1W*level* damage                                       #
#                                                                              #
#                                                                              #
################################################################################
extends Cond_Parent
class_name Physiological_Movement_Incapacitated

	
func _init(levelPara:int, durationPara:int) -> void:
	self.level    = levelPara
	self.duration = durationPara

	


func attachToEntWithClassName(ent): attachToEnt(ent,"Elemental_Fire_Burning")
func indexName_quack():      return "Elemental_Fire_Burning"
static func textureID_quack():      return "Conditions_0_0"



func isNeutraliced() -> bool:
	return false


func run():
	if !affectedEnt.is_queued_for_deletion():
		if affectedEnt is ActorEntity:           damageActor()
		
		if is_instance_valid(affectedEnt):
			spread()



func damageActor():
	API_019_Effect_Statmod.manageUniqueStatmod(affectedEnt, "U_DEAL_PLAIN_DAMAGE", -level)

func spread():
	var relevantFloor = SokraTiles.getMeatFloor()
	var pos           = affectedEnt.pos() + Util.RNG.getRandomPositionModifier(1)
	var entToSpread   = relevantFloor.getEntByPos_quack(pos)

	if entToSpread.has("C_63_IS_SPREADING_CONDITION") and hasNotConditionAlready(entToSpread):
		if entToSpread.getCompValue("C_63_IS_SPREADING_CONDITION")==indexName_quack():
			API_003_Condition.attachConditionToEnt(entToSpread, indexName_quack(), duration, level)
			entToSpread.addComponent(C_64_APPLY_CONDITION_WALKING.new("Elemental_Fire_Burning(3)["+str(level)+"]"))




