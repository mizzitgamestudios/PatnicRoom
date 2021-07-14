extends Component
class_name C_13_ACTOR_ROLE_NAME

var value 

func _init(valuePara):
	name="C_13_ACTOR_ROLE_NAME"
	value=valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "Groupname of Role",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "Role category",
}
static func name_quack():      return "C_13_ACTOR_ROLE_NAME"
static func dioJSONType_quack(): return "STRING"