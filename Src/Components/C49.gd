extends Component
class_name C_49_EFFECT_REFERENCE

var value

func _init(valuePara):
	name = "C_49_EFFECT_REFERENCE"
	value = valuePara



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
static func name_quack():      return "C_49_EFFECT_REFERENCE"
static func dioJSONType_quack(): return "EFFECT"