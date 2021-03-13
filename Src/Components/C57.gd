extends Component
class_name C_57_HITPOINTS


var value


func _init(valuePara):
	name="C_57_HITPOINTS"
	value = valuePara

func changeHitpoints(modValue):
	value = int(value) - int(modValue)
	if value <= 0: owner.free_queue()

static func name_quack():
	return "C_57_HITPOINTS"
