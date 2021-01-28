extends Component
class_name Comp_Bodyparts_ArrayOfBodyParts

var value = []

func _init(valuePara):
	name = "Comp_Bodyparts_ArrayOfBodyParts"
	value = valuePara


func addToInventory(entPara):
	value.append(entPara)

func removeFromInventory(entPara):
	value.remove(entPara)
