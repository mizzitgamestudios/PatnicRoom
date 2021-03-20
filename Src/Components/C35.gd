extends Component
class_name C_35_KIT_MECHANICAL_SUMMARY

var value

func _init(valuePara):
	name = "C_35_KIT_MECHANICAL_SUMMARY"
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
static func name_quack():      return "C_35_KIT_MECHANICAL_SUMMARY"
static func dioJSONType_quack(): return "STRING"