extends Component
class_name C_18_ACTOR_ATTRIBUTEMOD

var value=0

func _init():
	name = "C_18_ACTOR_ATTRIBUTEMOD"



func modValue(valuePara):
	value+=int(valuePara)



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
static func name_quack():      return "C_18_ACTOR_ATTRIBUTEMOD"
static func dioJSONType_quack(): return "INTEGER"