extends Object
class_name U_CHANGE_RAW_VALUE


var compToString  : String
var newValue

func _init(dictOfPara:Array):
	compToString  = dictOfPara[0]
	newValue = dictOfPara[1]




func getValueToString_quack():   return COMP.GET_COMPONENT(compToString).getAutoDoc()["nameToShow"] + " -> " +str(newValue)
func getName_quack():            return "U_CHANGE_RAW_VALUE"

func getParameter_quack(): 
	return {
		 "compToString"  : compToString
		,"newValue"      : newValue
	}



	
func run(ent):
	for currentEnt in ent:
		var saniticedValue = null
		
		if COMP.GET_COMPONENT(compToString) != null:
			var compToChange = currentEnt.getComp(compToString)
			
			if   compToChange.dioJSONType_quack() == "STRING"     : saniticedValue = addAsString(newValue)
			elif compToChange.dioJSONType_quack() == "INTEGER"    : saniticedValue = addAsInteger(newValue)
			elif compToChange.dioJSONType_quack() == "BOOLEAN"    : saniticedValue = addAsBool(newValue)
				
			if saniticedValue != null:
				compToChange.value = saniticedValue





func addAsBool(newValue):
	# --- BOOL --- #
	if newValue is bool: return newValue

	# ---- INTEGER --- #
	if   newValue is int and newValue == 1: return true
	elif newValue is int and newValue == 0: return false
	
	# --- STRING --- #
	var validStringsofTrueBools  = ["true"  , "TRUE"  , "IS_TRUE"  , "1"]
	var validStringsofFalseBools = ["false" , "FALSE" , "IS_FALSE" , "0"]

	for i in validStringsofTrueBools.size():
		if   validStringsofTrueBools[i]  == newValue: return true
		elif validStringsofFalseBools[i] == newValue: return false

			


func addAsInteger(newValue): return int(newValue)
func addAsString(newValue):  return str(newValue)




static func getDoc():
	return {
		
		"toShort"          : "",
		"keyword"          : "U_CHANGE_RAW_VALUE",
		"name"             : "change plain values",

		"unit"             : "EFFECT",    
		"stat"             : "STAT_MOD",

		"toString"         : "change a Component-values",

		"inputModule"      : "COMPONENT"

	}


