extends Cond_Parent
class_name Cond_BAN_Electrifying

	
func _init(levelPara:int, durationPara:int) -> void:
	self.level    = levelPara
	self.duration = durationPara

	


func attachToEntWithClassName(ent): attachToEnt(ent,"Cond_BAN_Electrifying")
func indexName_quack():      return "Cond_BAN_Electrifying"
static func textureID_quack():      return "Conditions_0_2"

func toString_quack(): return "Electrifying"

func isNeutraliced() -> bool:
	return false


func run():
	if !affectedEnt.is_queued_for_deletion():
		if affectedEnt is ActorEntity:           damageActor()
		
		if is_instance_valid(affectedEnt): spread()



func damageActor():
	API_009_Statmod.manageUniqueStatmod(affectedEnt, "U_DEAL_PLAIN_DAMAGE", -level)

func spread():
	var relevantFloor = SokraTiles.getMeatFloor()
	var pos           = affectedEnt.pos() + Util.RNG.getRandomPositionModifier(1)
	var entToSpread   = relevantFloor.getEntByPos_quack(pos)

	if entToSpread.has("C_63_APPLY_CONDITION_SPREADING") and hasNotConditionAlready(entToSpread):
		if entToSpread.getCompValue("C_63_APPLY_CONDITION_SPREADING")==indexName_quack():
			API_008_Condition.attachConditionToEnt(entToSpread, indexName_quack(), duration, level)
			entToSpread.addComponent(C_64_APPLY_CONDITION_WALKING.new("Cond_BAN_Electrifying(1)["+str(level)+"]"))



static func getDoc():
	return {
		
		"keyword"          : "U_MOVE_USER",
		"name"             : "Move User",

		"unit"             : "EFFECT",    
		"stat"             : "STAT_MOD",

		"toString"         : "WIP",

		"inputModule"      : "VOID"

	}
