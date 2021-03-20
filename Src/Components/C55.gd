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
var  autodoc={
	"suggestion"  : "",
	"description" : "name of its fightingstyle",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "role description",
}
static func name_quack():      return "C_55_Gear"
static func dioJSONType_quack(): return "NULL"