extends Component
class_name C_63_APPLY_CONDITION_SPREADING

var value 


func _init(valuePara):
	name="C_63_APPLY_CONDITION_SPREADING"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "makes it able to spread fire",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "burnable",
}
static func name_quack():      return "C_63_APPLY_CONDITION_SPREADING"
static func dioJSONType_quack(): return "STRING"
