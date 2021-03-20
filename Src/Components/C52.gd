extends Component
class_name C_52_ACTOR_GEAR

var value = []

func _init(valuePara):
	name = "C_52_ACTOR_GEAR"
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
static func name_quack():      return "C_52_ACTOR_GEAR"
static func dioJSONType_quack(): return "ARRAY"