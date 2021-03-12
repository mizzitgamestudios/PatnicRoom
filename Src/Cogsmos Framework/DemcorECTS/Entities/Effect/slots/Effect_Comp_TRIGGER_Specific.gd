extends Component
class_name Effect_Comp_TRIGGER_Specific

var value
var metaValue = []
var metaKeyword = []

func _init(valuePara):
	name = "Effect_Comp_TRIGGER_Specific"
	
	
	for i in valuePara.size():
		if valuePara[i][0] == "BASE":
			metaKeyword.append(valuePara[i][0])
			metaValue.append(valuePara[i][1])
		elif valuePara[i][0] == "HAS_STAT":
			metaKeyword.append(valuePara[i][0])
			metaValue.append([ valuePara[i][1],valuePara[i][2],valuePara[i][3] ])

		else:
			metaKeyword.append(valuePara[i][0])
			metaValue.append(valuePara[i][1])



