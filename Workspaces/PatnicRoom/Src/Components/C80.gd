extends Component
class_name C_65_IS_WET

var value 


func _init(valuePara):
	name="C_65_TIER"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "on a scale of 1 to 10",
	"description" : "quality of Item",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "tier",
}
static func name_quack():      return "C_65_TIER"
static func dioJSONType_quack(): return "INTEGER"
