extends Component
class_name C_34_ANY_LOG_TO_STRING

var value

func _init(valuePara):
	name = "C_34_ANY_LOG_TO_STRING"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "is shown to the player in logs",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "log entry",
}
static func name_quack():      return "C_34_ANY_LOG_TO_STRING"
static func dioJSONType_quack(): return "STRING"