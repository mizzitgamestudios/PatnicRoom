extends Component
class_name C_11_ACTOR_RACE_NAME

var value 

func _init(valuePara):
	name="C_11_ACTOR_RACE_NAME"
	value=valuePara



########################
# --- AUTODOC -------- #
########################
var  autodoc={
	"suggestion"  : "",
	"description" : "determinds basic attributes and relations",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "Race",
}
static func name_quack():      return "C_11_ACTOR_RACE_NAME"
static func dioJSONType_quack(): return "STRING"