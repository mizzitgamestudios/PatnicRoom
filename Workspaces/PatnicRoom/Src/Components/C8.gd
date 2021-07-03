extends Component
class_name C_8_STRUCTURE_HP


var value 


func _init(valuePara):
	name="C_8_STRUCTURE_HP"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "Health for inanimated Objects",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "Structural Healthpoint",
}
static func name_quack():      return "C_8_STRUCTURE_HP"
static func dioJSONType_quack(): return "INTEGER"
