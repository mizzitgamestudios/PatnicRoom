extends Component
class_name C_61_LOOT_TABLE


var value = {}


func _init(valuePara):
	name="C_61_LOOT_TABLE"
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
static func name_quack():      return "C_61_LOOT_TABLE"
static func dioJSONType_quack(): return "DICTIONARY"
