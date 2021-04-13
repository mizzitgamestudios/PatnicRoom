extends Object
class_name U_CHANGE_RAW_VALUE



static func run(selectedPos,modValue):
	var compToString   = modValue[0]
	var valueToChange  = modValue[1]
	var saniticedValue = null
	
	
	if COMP.GET_COMPONENT(compToString) != null:
		var compToChange = selectedPos.getComp(compToString)
		
		if   compToChange.dioJSONType_quack() == "STRING"     : saniticedValue = addAsString(valueToChange)
		elif compToChange.dioJSONType_quack() == "INTEGER"    : saniticedValue = addAsInteger(valueToChange)
		elif compToChange.dioJSONType_quack() == "BOOLEAN"    : saniticedValue = addAsBool(valueToChange)
			
		if saniticedValue != null:
			compToChange.value = saniticedValue





static func addAsBool(valueToChange):
	# --- BOOL --- #
	if valueToChange is bool: return valueToChange

	# ---- INTEGER --- #
	if   valueToChange is int and valueToChange == 1: return true
	elif valueToChange is int and valueToChange == 0: return false
	
	# --- STRING --- #
	var validStringsofTrueBools  = ["true"  , "TRUE"  , "IS_TRUE"  , "1"]
	var validStringsofFalseBools = ["false" , "FALSE" , "IS_FALSE" , "0"]

	for i in validStringsofTrueBools.size():
		if   validStringsofTrueBools[i]  == valueToChange: return true
		elif validStringsofFalseBools[i] == valueToChange: return false

			


static func addAsInteger(valueToChange): return int(valueToChange)
static func addAsString(valueToChange):  return str(valueToChange)


