extends Component
class_name C_16_ACTOR_BODYPARTS_CONNECTS

var value

func _init(valuePara):
	name = "C_16_ACTOR_BODYPARTS_CONNECTS"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "connected Bodyparts",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "list of linked bodyparts",
}
static func name_quack():      return "C_16_ACTOR_BODYPARTS_CONNECTS"
static func dioJSONType_quack(): return "ARRAY"
