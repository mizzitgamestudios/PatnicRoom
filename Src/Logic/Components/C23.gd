extends Component
class_name C_23_ACTOR_CARRIAGE

var capacity
var inventory = []

func _init(valuePara):
	name = "C_23_ACTOR_CARRIAGE"
	capacity = valuePara


func addToInventory(entPara):
	if isInventoryFull():
		inventory.append(entPara)

func removeFromInventory(entPara):
	inventory.remove(entPara)


func isInventoryFull():
	return inventory.size <= capacity

