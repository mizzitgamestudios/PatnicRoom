extends Object
class_name _Has_StatMod



static func run(collectedEnts,metaValues):
	var compToString   = metaValues[0]
	var operator       = metaValues[1]
	var comparator     = metaValues[2]
	
	var returnArr      = []
	
	for i in collectedEnts.size():
		var currentEnt = collectedEnts[i]
		
		var currentCompValue = currentEnt.getCompValue(compToString)
		if isComparrissonValid(str(currentCompValue),operator,comparator): 
			returnArr.append(currentEnt)
			#if currentEnt.hasCond(condName):  returnArr.append(currentEnt)


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
