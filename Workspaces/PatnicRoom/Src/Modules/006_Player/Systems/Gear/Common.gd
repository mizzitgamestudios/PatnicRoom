extends Node
class_name CommonInventory


var playerEntity

var listOfItems: Dictionary = {}

var credits

var carriageCapacity: int

func initialice(playerEntityPara):
	playerEntity = playerEntityPara
	credits      = playerEntity.getComp("C_9_CREDITS_ACCOUNT")





func getCredits():               return credits.value
func getItem(itemName:String):   return listOfItems[itemName]

func addItem(item):
	if listOfItems.size() <= carriageCapacity:
		listOfItems[item.to_string()] = item





