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
<<<<<<< HEAD
static func dioJSONType_quack(): return "STRING"
=======
static func dioJSONType_quack(): return "STRING"
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
