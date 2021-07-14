extends Object
class_name Effect_Trigger_Specific_Has_Condition


var condToString  : String
var condIntensity : String

func _init(dictOfPara:Array):
	condToString  = dictOfPara[0]
	condIntensity = dictOfPara[1]


	
func getValueToString_quack():   return "has "+condToString 
func getName_quack():            return "HAS_COND"

func getParameter_quack(): 
	return {
		 "condToString"  : condToString
		,"condIntensity" : condIntensity
	}




func run(collectedEnts):
	var returnArr = []

	for currentLayer in collectedEnts:
		for currentEnt in currentLayer:

			if currentEnt.hasCond(condToString):  returnArr.append(currentEnt)
		
	return returnArr


	


static func getDoc():
	return {
		
		"keyword"          : "HAS_CONDITION",
		"name"             : "has condition",

		"unit"             : "TRIGGER",    
		"stat"             : "SPECIFIC",

		"toString"        : "validates select if entity is affected by an Condition",

		"inputModule" : "CONDITION"

	}
