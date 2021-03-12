extends Component
class_name C_48_ANY_RARITY

var value

func _init(valuePara):
	name = "C_48_ANY_RARITY"
	value = valuePara

func enumToString() -> String:
	return ENUM.RARITY_TO_STRING.get(value)

static func name_quack():
	return "C_48_ANY_RARITY"
