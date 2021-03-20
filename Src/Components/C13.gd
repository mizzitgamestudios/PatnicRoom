extends Component
class_name C_13_ACTOR_ROLE_NAME

var value 

func _init(valuePara):
	name="C_13_ACTOR_ROLE_NAME"
	value=valuePara



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
static func name_quack():      return "C_13_ACTOR_ROLE_NAME"
static func dioJSONType_quack(): return "STRING"