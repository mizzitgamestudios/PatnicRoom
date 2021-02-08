extends Component
class_name Comp_Universall_Rarity

var value

func _init(valuePara):
	name = "Comp_Universall_Rarity"
	value = valuePara

func enumToString() -> String:
	return ENUM.RARITY_TO_STRING.get(value)
