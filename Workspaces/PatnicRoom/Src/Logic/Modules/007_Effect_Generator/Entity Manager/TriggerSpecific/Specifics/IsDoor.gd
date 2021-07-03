extends Object
class_name _Is_Door


static func run(collectedEnts,status):
	var returnArray = getAllDoorsInReach(collectedEnts)
	
	if hasAdvancedParameters(status):
		var cache   = returnArray
		returnArray = []
		
		var toLookUp: bool
		if status == "IS_OPEN"   : toLookUp = true
		if status == "IS_CLOSED" : toLookUp = false
		
		return getSpecificDoors(cache,toLookUp)
	
	
	return returnArray




static func getAllDoorsInReach(collectedEnts):
	var returnArray = []

	for currentEnt in collectedEnts:
		if currentEnt.hasFlag("F_9_IS_DOOR"): returnArray.append(currentEnt)
	
	return returnArray



static func hasAdvancedParameters(status): return status == "IS_OPEN" or status == "IS_CLOSED"

static func getSpecificDoors(cache,toLookUp):
	var returnArray= []

	for currentEnt in cache:
		var statusBool = currentEnt.getCompValue("C_1_ANY_IS_WALKABLE")
		
		if statusBool == toLookUp : returnArray.append(currentEnt)
	

	return returnArray





static func getDoc():
	return {
		
		"keyword"          : "IS_DOOR",
		"name"             : "is a door",

		"unit"             : "TRIGGER",    
		"stat"             : "SPECIFIC",

		"to stirng"        : "if it has the flag F_9_IS_DOOR",

		"module reference" : "IS_DOOR"

	}