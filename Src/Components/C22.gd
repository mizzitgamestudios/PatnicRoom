extends Component
class_name C_22_ACTOR_LIMITS

var value = {}

func _init(physicalLimit, socialLimit, mentalLimit):
	name = "C_22_ACTOR_LIMITS"
	value = {
		"physicalLimit":physicalLimit,
		"socialLimit":socialLimit,
		"mentalLimit":mentalLimit
	}

func getPysicalLimit():
	return value["physicalLimit"]
	
func getSozialLimit():
	return value["socialLimit"]
	
func getMentallLimit():
	return value["mentalLimit"]



########################
# --- AUTODOC -------- #
########################
const autodoc={
	"title":"relevant layer",
	"description":"descibes the most relevant layer of Tile",
	"className":"C_3_ANY_LAYER",
	"moduleName":"00_00 Basic Tile Components",
	"dataType":"String",
	"notable":"Needs to be a key of the naming convention 'ENUM.LAYERS_OF_EFFECT.SOKRATILES_LAYER'"
}
static func name_quack():      return "C_22_ACTOR_LIMITS"
static func dioJSONType_quack(): return "INTEGER"
