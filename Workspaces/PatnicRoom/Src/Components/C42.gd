extends Component
class_name C_42_ROLE_VARIETY

var value=[]

func _init(valuePara):
	name = "C_42_ROLE_VARIETY"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "name of its fightingstyle",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "role description",
}
static func name_quack():      return "C_42_ROLE_VARIETY"
static func dioJSONType_quack(): return "ARRAY"