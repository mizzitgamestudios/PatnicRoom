extends Object
class_name _005_Select


var priority = ["SPAWN","ONSET","HIT","OFFSET","N/A"]
var returnVal = -1
var kitpartToString

func getInitialKitsetSelect(kitset:KitSetEntity):
	var initialBase = checkForInitialByKitpart(API_005_KitSet.getKitPart(kitset,"BASE"))
	if isEarlierThanPrevious(initialBase): setNewInital(initialBase,"BASE")
	
	if kitset.hasMod():      checkFor("MOD",kitset,initialBase)
	if kitset.hasAppendix(): checkFor("APPENDIX",kitset,initialBase)
	
	
	var initialSelect = [kitpartToString,returnVal]
	kitset.initialSelect = initialSelect

	var cache = fillInitialDict(kitset)
	kitset.initialSelect = cache



func checkFor(kitpart:String,kitset,initialBase):
	var initialAppendix = checkForInitialByKitpart(API_005_KitSet.getKitPart(kitset,kitpart))
	if isEarlierThanPrevious(initialBase): setNewInital(initialAppendix,"APPENDIX")


func setNewInital(newKitpart,insertIfTrue:String):
	returnVal = priority.find(newKitpart)
	kitpartToString = insertIfTrue

	
func isEarlierThanPrevious(newKitpart:String):
	var prio = priority.find(newKitpart)
	return prio > returnVal



func checkForInitialByKitpart(kitPart:KitPartEntity):
		if   kitPart.effect.spawnComponent  != null: return "SPAWN"
		elif kitPart.effect.onsetComponent  != null: return "ONSET"
		elif kitPart.effect.hitComponent    != null: return "HIT"
		elif kitPart.effect.offsetComponent != null: return "OFFSET"




func fillInitialDict(kitSet):
	var dict                 = {}
	var arrToFill            = ["SPACE","TRIGGER_BASE","TRIGGER_SPECIFIC","EFFECT_STAT_MOD","EFFECT_CONDITION"]
	for i in arrToFill.size(): dict[ arrToFill[i] ] = API_005_KitSet.getInitialSlot(kitSet, arrToFill[i] )
	return dict
