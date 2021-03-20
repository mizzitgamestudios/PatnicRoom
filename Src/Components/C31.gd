extends Component
class_name C_31_KIT_CAT_TYPE

var value

func _init(valuePara):
	name = "C_31_KIT_CAT_TYPE"
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
static func name_quack():      return "C_31_KIT_CAT_TYPE"
static func dioJSONType_quack(): return "STRING"