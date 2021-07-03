extends Object
class_name Effect_Trigger_Specific_Is_Door


var state  : String

func _init(dictOfPara:Array):
	state  = dictOfPara[0]



func getName_quack():      
	return "IS_DOOR"

func getParameter_quack(): 
	return {
		 "state"  : state
	}

func getValueToString_quack():
	return state

func run(collectedEnts):
	var returnArray = getAllDoorsInReach(collectedEnts)
	
	if hasAdvancedParameters(state):
		var cache   = returnArray
		returnArray = []
		
		var toLookUp: bool
		if state == "IS_OPEN"   : toLookUp = true
		if state == "IS_CLOSED" : toLookUp = false
		
		return getSpecificDoors(cache,toLookUp)
	
	
	return returnArray


func getAllDoorsInReach(collectedEnts):
	var returnArray = []

	for currentEnt in collectedEnts:
		if currentEnt.hasFlag("F_9_IS_DOOR"): returnArray.append(currentEnt)
	
	return returnArray



func hasAdvancedParameters(status): return status == "IS_OPEN" or status == "IS_CLOSED"

func getSpecificDoors(cache,toLookUp):
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

		"toString"        : "if it has the flag F_9_IS_DOOR",

		"inputModule" : "IS_DOOR"

	}
