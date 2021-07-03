extends Component
class_name C_36_KIT_MOD_TIME

var value

func _init(valuePara):
	name = "C_36_KIT_MOD_TIME"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "guide value: Rarity*1,5",
	"description" : "number of Panicrooms before its usable",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "setup time",
}
static func name_quack():      return "C_36_KIT_MOD_TIME"
static func dioJSONType_quack(): return "STRING"
