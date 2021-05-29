extends Component
class_name C_17_ACTOR_BODYPARTS_HITPROBABILLITY

var value

func _init(valuePara):
	name = "C_17_ACTOR_BODYPARTS_HITPROBABILLITY"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "Bodypart hit %",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "propabillity to get random hit in percent",
}
static func name_quack():      return "C_17_ACTOR_BODYPARTS_HITPROBABILLITY"
static func dioJSONType_quack(): return "INTEGER"