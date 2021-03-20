extends Component
class_name C_43_PLAYER_DESCRIPTION

var value: String

func _init(valuePara:String):
	name = "C_43_PLAYER_DESCRIPTION"
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
static func name_quack():      return "C_43_PLAYER_DESCRIPTION"
static func dioJSONType_quack(): return "STRING"