extends Component
class_name C_45_PLAYER_NAME

var value: String

func _init(valuePara:String):
	name = "C_45_PLAYER_NAME"
	value = valuePara


	
########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "Playername",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "Playername",
}
static func name_quack():      return "C_45_PLAYER_NAME"
static func dioJSONType_quack(): return "STRING"
