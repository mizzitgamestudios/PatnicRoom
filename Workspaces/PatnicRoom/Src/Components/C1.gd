extends Component
class_name C_1_ANY_IS_WALKABLE

var value: bool

func _init(valuePara:bool):
	self.name = "C_1_ANY_IS_WALKABLE"
	value = valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "determinds if an Actor can walk on this tile",
	"validInputs" : ["true","false"],
	"validType"   : "validInputs",
	"nameToShow"  : "Walkable",
}
static func name_quack():      return "C_1_ANY_IS_WALKABLE"
static func dioJSONType_quack(): return "BOOLEAN"
