extends Entity
class_name KitventoryEntity


var listOfKits: Dictionary = {}
var maxKits: int


func getKit(kitToString:String):
	return listOfKits[kitToString]

func getKitByLevel(kitLevel:int):
	return listOfKits.values()[kitLevel]

func addKit(kit:KitSetEntity):
	if listOfKits.size() <= maxKits:
		listOfKits[kit.toString()] = kit

