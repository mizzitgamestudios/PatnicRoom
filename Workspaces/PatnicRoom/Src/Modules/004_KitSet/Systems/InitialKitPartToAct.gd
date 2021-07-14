extends Object
class_name _005_Select


# ----- MAIN --------------------------------------------------------------------- ##


var priority = ["SPAWN","ONSET","HIT","OFFSET","N/A"]
var returnVal = -1
var kitpartToString

func getInitialKitsetSelect(kitset:KitSetEntity):
	var initialBase = checkForInitialByKitpart(kitset.effect)
	if isEarlierThanPrevious(initialBase): setNewInital(initialBase,"BASE")
	
	
	var initialSelect = [kitpartToString,returnVal]
	kitset.initialSelect = initialSelect

	var cache = fillInitialDict(kitset)
	kitset.initialSelect = cache



# ----- SETTER ------------------------------------------------------------------- ##


func fillInitialDict(kitSet):
	var dict                 = {}
	var arrToFill            = ["SPACE","TRIGGER_BASE","TRIGGER_SPECIFIC","EFFECT_STAT_MOD","EFFECT_CONDITION"]
	for i in arrToFill.size(): dict[ arrToFill[i] ] = API_004_KitSet.getInitialSlot(kitSet, arrToFill[i] )
	return dict



# ----- HELPER ------------------------------------------------------------------- ##


func checkForInitialByKitpart(effect):
	if   effect.spawnComponent  != null: return "SPAWN"
	elif effect.onsetComponent  != null: return "ONSET"
	elif effect.hitComponent    != null: return "HIT"
	elif effect.offsetComponent != null: return "OFFSET"



func isEarlierThanPrevious(newKitpart:String):   return priority.find(newKitpart) > returnVal

func setNewInital(newKitpart,insertIfTrue:String):
	returnVal = priority.find(newKitpart)
	kitpartToString = insertIfTrue



