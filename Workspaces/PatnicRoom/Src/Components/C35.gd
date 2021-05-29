extends Component
class_name C_35_KIT_MECHANICAL_SUMMARY

var value

func _init(valuePara):
	name = "C_35_KIT_MECHANICAL_SUMMARY"
	value = valuePara


	
########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "about 80 characters at max",
	"description" : "shown as short explaination of usage",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "summary",
}
static func name_quack():      return "C_35_KIT_MECHANICAL_SUMMARY"
static func dioJSONType_quack(): return "STRING"