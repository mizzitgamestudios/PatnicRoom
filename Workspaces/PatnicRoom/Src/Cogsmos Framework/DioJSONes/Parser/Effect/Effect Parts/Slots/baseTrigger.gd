extends Component
class_name Effect_Comp_TRIGGER_Base

var value

func _init(valuePara):
	name = "Effect_Comp_TRIGGER_Base"
	
	if SYNTAX.EFFECT.HAS_TRIGGER_BASE(valuePara):
		value = valuePara



