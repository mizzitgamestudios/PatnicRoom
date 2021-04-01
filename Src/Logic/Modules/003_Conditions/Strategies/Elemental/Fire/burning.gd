extends Cond_Parent
class_name Cond_Burning_Root

	
func _init(levelPara:int, durationPara:int) -> void:
	self.level = levelPara
	self.duration = durationPara

	self.logToString
	
	self.symbioticComponents = {}
#
#	self.conditionSymbiotic = {
#		 "Elemental_Fire_Burning" : IC_1_FOO
#	}



static func indexName_quack():   return "Elemental_Fire_Burning"
static func textureID_quack():   return "Conditions_0_0"



func isNeutraliced() -> bool:    return false



func run():
	if affectedEnt is ActorEntity:                  damageActor()
	if affectedEnt.textureID() == "Suburban_0_1":   spread()


func damageActor():
	DIOJSONES_UNIQUE_STATMOD.manageUniqueStatmod(affectedEnt, "U_DEAL_PLAIN_DAMAGE", level)

func spread():
	var ent = SokraTiles.getMeatFloor().getEntByPos_quack(int(affectedEnt.pos().x-1),affectedEnt.pos().y+1)
	if ent.textureID() == "Suburban_0_1" and !ent.dictOfConds.has(self.textureID_quack()):
		API_003_Condition.attachConditionToEnt(ent, self.indexName_quack(), self.duration, self.level)
