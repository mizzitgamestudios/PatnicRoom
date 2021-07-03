extends Node
class_name Parser_Kit



static func parse():
	var dictToReturn = {}
	
	var unitToString = ["TIME","SPACE","TRIGGER","EFFECT"]
	var toParse      = getArrOfSlotsToParse()
	var effectDict   =  prepareDict()
	
	return parseEffect(effectDict,toParse,unitToString)



static func parseEffect(effectDict,toParse,unitToString):
	var counter = -1
	
	for filled in toParse:
		counter += 1
		if filled: for unit in unitToString:
			
			
			var slot  = keyToString(unit,counter+1)
			var currentSlot = Parser.cachedEffectSet[counter]
			
			match unit:
				"TRIGGER" : effectDict[unit][slot] = setTrigger(currentSlot)
				"SPACE"   : effectDict[unit][slot] = setSpace(currentSlot)
				"EFFECT"  : effectDict[unit][slot] = setEffect(currentSlot)
				"TIME"    : effectDict[unit][slot] = setTime(currentSlot)
	
	return effectDict


static func setTrigger(slot:EffectCache):
	return { "BASE"        : slot.triggerBase,
			 "SPECIFIC"    : slot.triggerSpecific }

static func setSpace(slot:EffectCache):
	return { "REACH"      : slot.spaceReach,
			 "MEDIUM"     : slot.spaceMedium, 
			 "SOURCE"     : slot.spaceSource,
			 "M_TYPE"     : slot.spaceMType }

static func setEffect(slot:EffectCache):
	return { "CONDITION"  : slot.effectCondition,
			 "STAT_MOD"   : slot.effectStatmod }

static func setTime(slot:EffectCache):
	if slot.spaceLength == 0: return "N/A"
	else:                     return slot.spaceLength




static func keyToString(unit,slot,decrement=true)->String:  return unit+"-"+str(slot)

static func getArrOfSlotsToParse():
	var toDraw = []
	for currentSet in Parser.cachedEffectSet: 
		var duration = currentSet.spaceLength
		
		toDraw.append( duration != 0)
	return toDraw

static func prepareDict():
	var dictToReturn = {}
	dictToReturn["TRIGGER"] = {}
	dictToReturn["SPACE"]   = {}
	dictToReturn["EFFECT"]  = {}
<<<<<<< HEAD
	dictToReturn["TIME"]    = { "TIME-0":"N/A","TIME-1":"N/A","TIME-2":"N/A","TIME-3":"N/A" }
=======
	dictToReturn["TIME"]    = { "TIME-1":"N/A","TIME-2":"N/A","TIME-3":"N/A","TIME-4":"N/A" }
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
	return dictToReturn


