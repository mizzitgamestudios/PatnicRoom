extends Component
class_name C_60_BASE_KIT_REFERENCE


var value 


func _init(valuePara):
	name="C_60_BASE_KIT_REFERENCE"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "choose the kit to specialice",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "base-kit reference",
}
static func name_quack():      return "C_60_BASE_KIT_REFERENCE"
static func dioJSONType_quack(): return "STRING"
