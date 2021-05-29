extends Component
class_name C_49_EFFECT_REFERENCE

var value

func _init(valuePara):
	name = "C_49_EFFECT_REFERENCE"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "name of its fightingstyle",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "Is used to build EffectEntity",
}
static func name_quack():      return "C_49_EFFECT_REFERENCE"
static func dioJSONType_quack(): return "EFFECT"
