extends Component
class_name Comp_Actor_Carriage

var capacity
var inventory = []

func _init(valuePara):
	name = "Comp_Actor_Carriage"
	capacity = valuePara


func addToInventory(entPara):
	if isInventoryFull():
		inventory.append(entPara)

func removeFromInventory(entPara):
	inventory.remove(entPara)


func isInventoryFull():
	return inventory.size <= capacity

