extends Component
class_name C_37_ANY_M_TYPE

var value

func _init(valuePara):
	name = "C_37_ANY_M_TYPE"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "name of its fightingstyle",
	"validInputs" : ["MEAT","MAGIC","MATRIX"],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "layer of perception",
}
static func name_quack():      return "C_37_ANY_M_TYPE"
static func dioJSONType_quack(): return "STRING"
