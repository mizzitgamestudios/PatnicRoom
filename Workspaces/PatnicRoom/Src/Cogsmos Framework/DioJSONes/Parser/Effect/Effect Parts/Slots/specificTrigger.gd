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
			metaValue.append([ valuePara[i][1][0],valuePara[i][1][1],valuePara[i][1][2] ])
		
		elif valuePara[i][0] == "AND" or valuePara[i][0] == "OR":
			metaKeyword.append(valuePara[i][0])
			metaValue.append(valuePara[i][0])

		else:
			metaKeyword.append(valuePara[i][0])
			metaValue.append(valuePara[i][1])



