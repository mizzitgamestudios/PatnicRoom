extends Object
class_name Effect_Trigger_Specific_Has_StatMod


var compToString : String
var operator     : String
var comparator   : String

func _init(dictOfPara:Array):
	compToString = dictOfPara[0][0]
	operator     = dictOfPara[0][1]
	comparator   = dictOfPara[0][2]



func getValueToString_quack():   return COMP.GET_COMPONENT(compToString).getAutoDoc()["nameToShow"] + " " + operator + " " + comparator 
func getName_quack():            return "COMPARE_STAT"

func getParameter_quack(): 
	return {
		 "compToString" : compToString
		,"operator"     : operator
		,"comparator"   : comparator
	}




func run(collectedEnts):
	var returnArr = []
	
	for currentEnt in collectedEnts:
		
		if currentEnt.has(compToString):
			var currentCompValue = str( currentEnt.getCompValue(compToString) )
			
			if isComparrissonValid(currentCompValue, operator, comparator): 
				returnArr.append(currentEnt)


	return returnArr


func isComparrissonValid(condName:String,operator:String,comparator:String):
	if isConvertableToInteger(comparator) and isConvertableToInteger(condName):
		match operator:
			">"  :  return int(condName) >  int(comparator)
			"<"  :  return int(condName) <  int(comparator)
			"==" :  return int(condName) == int(comparator)
			"!=" :  return int(condName) != int(comparator)
	
	else:
		match operator:
			"==" :  return condName == comparator
			"!=" :  return condName != comparator


func isConvertableToInteger(value):
	var numbers = ["1","2","3","4","5","6","7","8","9","0"]
	for i in value.length(): if !numbers.has(value[i]): return false
	return true





static func getDoc():
	return {
		
		"keyword"          : "HAS_STAT",
		"name"             : "compare stat",

		"unit"             : "TRIGGER",    
		"stat"             : "SPECIFIC",

		"toString"        : "compare the stat X if its Y than Z",

		"inputModule" : "COMPARATOR"

	}
