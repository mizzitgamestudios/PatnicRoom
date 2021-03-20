extends Component
class_name C_44_PLAYER_STREETNAME

var value: String

func _init(valuePara:String):
	name = "C_44_PLAYER_STREETNAME"
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
static func name_quack():      return "C_44_PLAYER_STREETNAME"
static func dioJSONType_quack(): return "STRING"