extends Component
class_name C_15_ACTOR_ARRAY_BODYPARTS

var value = []

func _init(valuePara):
	name = "C_15_ACTOR_ARRAY_BODYPARTS"
	value = valuePara


func addToInventory(entPara):
	value.append(entPara)

func removeFromInventory(entPara):
	value.remove(entPara)

static func name_quack():
	return "C_15_ACTOR_ARRAY_BODYPARTS"
