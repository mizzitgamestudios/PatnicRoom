extends Component
class_name C_48_ANY_RARITY

var value

func _init(valuePara):
	name = "C_48_ANY_RARITY"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "1: Drek, 5: Fixer, 10: R&D-Prototype",
	"description" : "chance to loot on a scale of 1 to 10",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "Rarity",
}
static func name_quack():      return "C_48_ANY_RARITY"
static func dioJSONType_quack(): return "INTEGER"