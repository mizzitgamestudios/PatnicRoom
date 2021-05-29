extends Component
class_name C_6_TILE_NAME

var value: String

func _init(valuePara:String):
	name = "C_6_TILE_NAME"
	value = String(valuePara)



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "short reference name shown in the most cases",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "Name",
}
static func name_quack():      return "C_6_TILE_NAME"
static func dioJSONType_quack(): return "STRING"
