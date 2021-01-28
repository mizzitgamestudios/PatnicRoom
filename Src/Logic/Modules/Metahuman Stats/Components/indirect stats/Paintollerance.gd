extends Component
class_name Comp_Actor_Paintollerance

var value

func _init():
	name = "Comp_Actor_Paintollerance"
	value = 0

func modValue(valuePara):
	value = value + valuePara
