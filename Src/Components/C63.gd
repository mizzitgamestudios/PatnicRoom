extends Component
class_name C_63_IS_BURNABLE

var value 


func _init(valuePara):
	name="C_63_IS_BURNABLE"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
var  autodoc={
	"suggestion"  : "",
	"description" : "makes it able to spread fire",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "burnable",
}
static func name_quack():      return "C_63_IS_BURNABLE"
static func dioJSONType_quack(): return "BOOLEAN"
