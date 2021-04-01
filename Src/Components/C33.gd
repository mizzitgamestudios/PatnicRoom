extends Component
class_name C_33_KIT_COOLDOWN_TIMER

var value:int

func _init(valuePara):
	name = "C_33_KIT_COOLDOWN_TIMER"
	value = int(valuePara)


########################
# --- AUTODOC -------- #
########################
var  autodoc={
	"suggestion"  : "guide value: Rarity*1",
	"description" : "by actions of player",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "cooldown",
}
static func name_quack():      return "C_33_KIT_COOLDOWN_TIMER"
static func dioJSONType_quack(): return "INTEGER"