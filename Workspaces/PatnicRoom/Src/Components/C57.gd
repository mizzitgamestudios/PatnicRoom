extends Component
class_name C_57_HITPOINTS


var value


func _init(valuePara):
	name="C_57_HITPOINTS"
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
static func name_quack():      return "C_57_HITPOINTS"
static func dioJSONType_quack(): return "INTEGER"
