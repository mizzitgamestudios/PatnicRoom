extends Component
class_name C_54_ANY_ENTITY_TYPE

var value 


func _init(valuePara):
	name = "C_54_ANY_ENTITY_TYPE"
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
static func name_quack():      return "C_54_ANY_ENTITY_TYPE"
static func dioJSONType_quack(): return "STRING"
