extends Component
class_name C_45_PLAYER_NAME

var value: String

func _init(valuePara:String):
	name = "C_45_PLAYER_NAME"
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
static func name_quack():      return "C_45_PLAYER_NAME"
static func dioJSONType_quack(): return "STRING"