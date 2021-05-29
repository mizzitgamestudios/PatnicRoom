extends Component
class_name C_62_LOOT_STATE


var value 


func _init(valuePara):
	name="C_62_LOOT_STATE"
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
static func name_quack():      return "C_62_LOOT_STATE"
static func dioJSONType_quack(): return "STRING"
