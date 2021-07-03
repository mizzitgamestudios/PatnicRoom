extends Component
class_name Effect_Comp_TRIGGER_Specific

var specificTriggers = []

func _init(valuePara):
	name = "Effect_Comp_TRIGGER_Specific"
	var keywords = SYNTAX.EFFECT().TRIGGER.SPECIFIC
	
	for currentEntry in valuePara:
		var meta  = currentEntry[0]
		
		if isConnector(meta):   specificTriggers.append(meta)
		
		else:
			var value           = currentEntry[1]
			var keywordInstance = keywords[meta].new( [value] )
			specificTriggers.append(keywordInstance)




func isConnector(meta): return meta == "AND" or meta == "OR"

