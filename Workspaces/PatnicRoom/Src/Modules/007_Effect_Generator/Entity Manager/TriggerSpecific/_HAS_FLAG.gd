extends Object
class_name Effect_Trigger_Specific_Has_Flag


var flagToString : String

func _init(dictOfPara:Array):
	flagToString = dictOfPara[0]


func getValueToString_quack():   return flagToString
func getName_quack():            return "HAS_FLAG"

func getParameter_quack(): 
	return {
		 "flagToString" : flagToString
	}



func run(collectedEnts):
	var flagNr = COMP.GET_FLAG(flagToString)
	var returnArr = []
	
	for currentEnt in collectedEnts:
		if currentEnt.hasFlag(flagNr):  returnArr.append(currentEnt)
	
	return returnArr





static func getDoc():
	return {
		
		"keyword"          : "HAS_FLAG",
		"name"             : "has Flag",

		"unit"             : "TRIGGER",    
		"stat"             : "SPECIFIC",

		"toString"        : "validates select if entity has COMP.FLAG",

		"inputModule" : "VOID"

	}
