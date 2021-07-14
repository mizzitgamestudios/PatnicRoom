extends Component
class_name Effect_Comp_EFFECT_Statmod


var statModList = []


func _init(dict):
	name = "Effect_Comp_EFFECT_Statmod"
	var keywords = _Syntax_Effect_Statmod.EFFECT_UNIQUE_STATMOD
	
	for currentEntry in dict:
		
		var meta  = currentEntry[0]
		
		
		if meta == "U_CHANGE_RAW_VALUE":
			var compToString = currentEntry[1]
			var value        = currentEntry[2]
			var instance = keywords[meta].new([compToString,value])
			statModList.append(instance)
		
		else:
			var value = currentEntry[1]
			var instance = keywords[meta].new([value])
			statModList.append(instance)





