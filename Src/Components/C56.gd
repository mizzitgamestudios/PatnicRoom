extends Component
class_name C_56_BASE_CONNECTOR


var listOfItems: Dictionary = {}
var carriageCapacity: int


func getItem(itemName:String):
	return listOfItems[itemName]

func addItem(item):
	if listOfItems.size() <= carriageCapacity:
		listOfItems[item.to_string()] = item

static func name_quack():
	return "C_56_BASE_CONNECTOR"
