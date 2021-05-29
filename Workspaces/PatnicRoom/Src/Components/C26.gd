extends Component
class_name C_26_ACTOR_INDIRECT_STATS

var attributesBlock

var hitpoints
var condition

var carriageCapacity

var physicalLimit
var socialLimit
var mentalLimit


func _init(dict,entToFill):
	name = "C_26_ACTOR_INDIRECT_STATS"
	if dict is C_19_ACTOR_ATTRIBUTES:
		updateStats(dict,entToFill)


func updateStats(dict,entToFill):
	attributesBlock   = dict
	hitpoints         = 8+(attributesBlock.constitution.value/3)
	entToFill.addComponent( C_57_HITPOINTS.new(hitpoints) )
	
	carriageCapacity = attributesBlock.strength.value + (attributesBlock.constitution.value  * 2)
	entToFill.addComponent( C_23_ACTOR_CARRIAGE.new(carriageCapacity) )
	
	physicalLimit    = (attributesBlock.constitution.value  +attributesBlock.reaction.value   +(attributesBlock.strength.value  * 2))  / 3
	socialLimit      = (attributesBlock.constitution.value  +attributesBlock.intuition.value  +(attributesBlock.charisma.value  * 2))  / 3
	mentalLimit      = (attributesBlock.willpower.value     +attributesBlock.intuition.value  +(attributesBlock.logic.value     * 2))  / 3
	entToFill.addComponent( C_22_ACTOR_LIMITS.new(physicalLimit, socialLimit, mentalLimit) )


########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "name of its fightingstyle",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "Indirect Stats",
}
static func name_quack():      return "C_26_ACTOR_INDIRECT_STATS"
static func dioJSONType_quack(): return "DICTIONARY"
