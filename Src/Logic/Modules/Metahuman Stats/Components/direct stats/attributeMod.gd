extends Component
class_name Comp_NPC_AttributeMod

var value=0

func _init():
	name = "Comp_NPC_AttributeMod"



func modValue(valuePara):
	value+=int(valuePara)

