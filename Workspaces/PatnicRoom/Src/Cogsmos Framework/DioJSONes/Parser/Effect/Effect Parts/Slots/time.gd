extends Component
class_name Effect_Comp_TIME

var metaValue
var value

func _init(valuePara):
	name = "Effect_Comp_TIME"
	
	if valuePara == "INSTANT":
		value = 0
		metaValue = valuePara
	

	else:
		value = int(valuePara)
		metaValue = "TIME_DELAY"
	
		if valuePara == "N/A":
			value = 999
			metaValue = "N/A"
	
		
		if valuePara == "0":
			value = 0
			metaValue = "INSTANT"
	



