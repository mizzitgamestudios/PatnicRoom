extends Component
class_name C_40_ANY_TO_STRING

var value

func _init(valuePara):
	name = "C_40_ANY_TO_STRING"
	value = valuePara


########################
# --- AUTODOC -------- #
########################
var  autodoc={
	"suggestion"  : "",
	"description" : "name of its fightingstyle",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "role description",
}
static func name_quack():      return "C_40_ANY_TO_STRING"
static func dioJSONType_quack(): return "STRING"
