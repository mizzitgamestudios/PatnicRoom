extends Entity
class_name GearEntity


var listOfItems: Dictionary = {}
var carriageCapacity: int


func getItem(itemName:String):
	return listOfItems[itemName]

func addItem(item):
	if listOfItems.size() <= carriageCapacity:
		listOfItems[item.to_string()] = item
