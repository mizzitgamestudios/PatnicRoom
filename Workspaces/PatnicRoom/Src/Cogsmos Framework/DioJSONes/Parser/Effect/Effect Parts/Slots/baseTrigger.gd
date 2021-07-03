extends Component
class_name Effect_Comp_TRIGGER_Base

var value

func _init(valuePara):
	name = "Effect_Comp_TRIGGER_Base"
	
	if Effect_Generator_Syntax.EFFECT_TRIGGER_BASE.has(valuePara):
		value = valuePara



