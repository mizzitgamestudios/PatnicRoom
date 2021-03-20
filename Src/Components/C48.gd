extends Component
class_name C_48_ANY_RARITY

var value

func _init(valuePara):
	name = "C_48_ANY_RARITY"
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
static func name_quack():      return "C_48_ANY_RARITY"
static func dioJSONType_quack(): return "INTEGER"