extends Component
class_name C_9_CREDITS_ACCOUNT


var value 


func _init(valuePara):
	name="C_9_CREDITS_ACCOUNT"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
var  autodoc={
	"suggestion"  : "",
	"description" : "amount of money",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "credits",
}
static func name_quack():      return "C_9_CREDITS_ACCOUNT"
static func dioJSONType_quack(): return "INTEGER"
