extends Component
class_name C_7_TILE_STATIC_TILESET_NR

var value: int

func _init(valuePara:int):
	name = "C_7_TILE_STATIC_TILESET_NR"
	value = int(valuePara)



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
static func name_quack():      return "C_7_TILE_STATIC_TILESET_NR"
static func dioJSONType_quack(): return "INTEGER"
