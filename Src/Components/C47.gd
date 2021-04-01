extends Component
class_name C_47_ANY_SYNONYM

var value

func _init(valuePara):
	name = "C_47_ANY_SYNONYM"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
var  autodoc={
	"suggestion"  : "",
	"description" : "list of differnt names for this spcialication",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "synonyms",
}
static func name_quack():      return "C_47_ANY_SYNONYM"
static func dioJSONType_quack(): return "ARRAY"
