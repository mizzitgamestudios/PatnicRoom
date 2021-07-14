extends Component
class_name C_30_ANY_NEEDED_BACKPACK_SLOTS

var value: int

func _init(valuePara):
	name = "C_30_ANY_NEEDED_BACKPACK_SLOTS"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "name of its fightingstyle",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "role description",
}
static func name_quack():      return "C_30_ANY_NEEDED_BACKPACK_SLOTS"
static func dioJSONType_quack(): return "INTEGER"