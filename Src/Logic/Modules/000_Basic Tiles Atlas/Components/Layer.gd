extends Component
class_name Comp_Tile_Layer

var value: String

func _init(valuePara:String):
	name = "Comp_Tile_Layer"
	value = valuePara

########################
# --- AUTODOC -------- #
########################
const autodoc={
	"title":"relevant layer",
	"description":"descibes the most relevant layer of Tile",
	"className":"Comp_Tile_Layer",
	"moduleName":"00_00 Basic Tile Components",
	"dataType":"String",
	"notable":"Needs to be a key of the naming convention 'ENUM.LAYERS_OF_EFFECT.SOKRATILES_LAYER'"
}