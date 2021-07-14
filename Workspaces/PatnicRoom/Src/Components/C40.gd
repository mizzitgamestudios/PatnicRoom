extends Component
class_name C_40_ANY_TO_STRING

var value

func _init(valuePara):
	name = "C_40_ANY_TO_STRING"
	value = valuePara


########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "often as same as C_6",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "toString",
}
static func name_quack():      return "C_40_ANY_TO_STRING"
static func dioJSONType_quack(): return "STRING"
