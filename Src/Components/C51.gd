extends Component
class_name C_50_ACTOR_ROLE_DESCRIPTION

var value 

func _init(valuePara):
	name="C_50_ACTOR_ROLE_DESCRIPTION"
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
static func name_quack():      return "C_50_ACTOR_ROLE_DESCRIPTION"
static func dioJSONType_quack(): return "STRING"
