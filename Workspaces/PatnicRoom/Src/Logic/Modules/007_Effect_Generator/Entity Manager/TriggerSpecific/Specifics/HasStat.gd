extends Object
class_name _Has_StatMod



static func run(collectedEnts,metaValues):
	var compToString   = metaValues[0]
	var operator       = metaValues[1]
	var comparator     = metaValues[2]
	
	var returnArr      = []
	
	
	for currentEnt in collectedEnts:
		
		if currentEnt.has(compToString):
			var currentCompValue = str( currentEnt.getCompValue(compToString) )
			
			if isComparrissonValid(currentCompValue, operator, comparator): 
				returnArr.append(currentEnt)


	return returnArr





static func isComparrissonValid(condName:String,operator:String,comparator:String):
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



static func isConvertableToInteger(value):
	var numbers = ["1","2","3","4","5","6","7","8","9","0"]
	for i in value.length(): if !numbers.has(value[i]): return false
	return true


static func getDoc():
	return {
		
		"keyword"          : "HAS_STAT",
		"name"             : "compare stat",

		"unit"             : "TRIGGER",    
		"stat"             : "SPECIFIC",

		"to stirng"        : "compare the stat X if its Y than Z",

		"module reference" : "COMPARATOR"

	}
