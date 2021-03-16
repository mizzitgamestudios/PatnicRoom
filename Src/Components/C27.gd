extends Component
class_name C_27_ACTOR_RACIAL_ENEMIES

var races = []

func _init(entRacesArrayPara):
	name = "C_27_ACTOR_RACIAL_ENEMIES"
	races = entRacesArrayPara

func addToInventory(entPara):
	races.append(entPara)

func removeFromInventory(entPara):
	races.remove(entPara)



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
static func name_quack():      return "C_27_ACTOR_RACIAL_ENEMIES"
static func dioJSONType_quack(): return "ARRAY"
