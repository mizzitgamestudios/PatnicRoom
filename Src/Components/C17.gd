extends Component
class_name C_17_ACTOR_BODYPARTS_HITPROBABILLITY

var value

func _init(valuePara):
	name = "C_17_ACTOR_BODYPARTS_HITPROBABILLITY"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
var  autodoc={
	"suggestion"  : "",
	"description" : "name of its fightingstyle",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "role description",
}
static func name_quack():      return "C_17_ACTOR_BODYPARTS_HITPROBABILLITY"
static func dioJSONType_quack(): return "INTEGER"