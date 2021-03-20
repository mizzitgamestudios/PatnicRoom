extends Component
class_name C_16_ACTOR_BODYPARTS_CONNECTS

var value

func _init(valuePara):
	name = "C_16_ACTOR_BODYPARTS_CONNECTS"
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
static func name_quack():      return "C_16_ACTOR_BODYPARTS_CONNECTS"
static func dioJSONType_quack(): return "STRING"
