extends Component
class_name C_6_TILE_NAME

var value: String

func _init(valuePara):
	name = "C_6_TILE_NAME"
	value = valuePara

static func name_quack():
	return "C_6_TILE_NAME"

func getString()->String:
	return value
