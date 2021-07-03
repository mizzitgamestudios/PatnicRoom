extends Component
class_name C_32_ANY_LIST_OF_CONDITIONS

var value

func _init(valuePara):
	name = "Comp_Kit_ConnectedConditions"
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
static func name_quack():      return "C_32_ANY_LIST_OF_CONDITIONS"
static func dioJSONType_quack(): return "ARRAY"