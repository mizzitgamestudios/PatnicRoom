extends Component
class_name C_15_ACTOR_ARRAY_BODYPARTS

var value = []

func _init(valuePara):
	name = "C_15_ACTOR_ARRAY_BODYPARTS"
	value = valuePara


func addToInventory(entPara):
	value.append(entPara)

func removeFromInventory(entPara):
	value.remove(entPara)



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
static func name_quack():        return "C_15_ACTOR_ARRAY_BODYPARTS"
static func dioJSONType_quack(): return "CONTAINER"