extends Object
class_name _Has_Condition



static func run(collectedEnts,condName:String):
	var returnArr = []

	for currentLayer in collectedEnts:
		for currentEnt in currentLayer:

			if currentEnt.hasCond(condName):  returnArr.append(currentEnt)

				
	return returnArr



static func getDoc():
	return {
		
		"keyword"          : "HAS_CONDITION",
		"name"             : "has condition",

		"unit"             : "TRIGGER",    
		"stat"             : "SPECIFIC",

		"to stirng"        : "validates select if entity is affected by an Condition",

		"module reference" : "CONDITION"

	}