extends Component
class_name C_43_PLAYER_DESCRIPTION

var value: String

func _init(valuePara:String):
	name = "C_43_PLAYER_DESCRIPTION"
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
static func name_quack():      return "C_43_PLAYER_DESCRIPTION"
static func dioJSONType_quack(): return "STRING"