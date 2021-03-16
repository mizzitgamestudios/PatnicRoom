extends Component
class_name C_55_Gear


var listOfItems: Dictionary = {}
var carriageCapacity: int

func _init():
	name = "C_55_Gear"
func getItem(itemName:String):
	return listOfItems[itemName]

func addItem(item):
	if listOfItems.size() <= carriageCapacity:
		listOfItems[item.to_string()] = item

		

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
static func name_quack():      return "C_55_Gear"
static func dioJSONType_quack(): return "NULL"