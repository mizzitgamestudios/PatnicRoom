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
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "name of its fightingstyle",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "role description",
}
static func name_quack():      return "C_55_Gear"
<<<<<<< HEAD
static func dioJSONType_quack(): return "NULL"
=======
static func dioJSONType_quack(): return "NULL"
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
