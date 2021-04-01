extends Node
class_name _002_EntityManager 

var syntax = Effect_Generator_Syntax.new()


func buildEffectProcess(dictOfProperties:Dictionary):
	var allSlots = []
	
	for unit in syntax.EFFECT_UNIT.size():
		if selectSlotAndUnit(dictOfProperties,"TIME",unit) == "N/A":
			allSlots.append("N/A")
		
		
		else:
			var effectSlot = Effect_Unit_Component.new()
			allSlots.append(effectSlot)
			for slotNr in syntax.EFFECT_SLOT.size():
				
				
				var currentSlotName = syntax.EFFECT_SLOT[slotNr]
				var dictToParse = selectSlotAndUnit(dictOfProperties,currentSlotName,unit)
				
				match currentSlotName:
					"TIME":
						effectSlot.time = Effect_Comp_TIME.new(dictToParse)
					"TRIGGER":
						effectSlot.triggerBase = Effect_Comp_TRIGGER_Base.new(dictToParse["BASE"])
						effectSlot.triggerSpecific = Effect_Comp_TRIGGER_Specific.new(dictToParse["SPECIFIC"])
					"SPACE":
						effectSlot.space = Effect_Comp_SPACE.new(dictToParse)
					"EFFECT":
						effectSlot.effectStatmod = Effect_Comp_EFFECT_Statmod.new(dictToParse["STAT_MOD"])
						effectSlot.effectCondition = Effect_Comp_EFFECT_Condition.new(dictToParse["CONDITION"])
	
	return constructByListOfSlots(allSlots)


func selectSlotAndUnit(dict:Dictionary,slot:String,timeUnit:int):
	var cache = dict [slot]
	return cache[slot+"-"+str(timeUnit)]

	
func constructByListOfSlots(slotList:Array):
	var ent = EffectEntity.new()
	ent.spawnComponent  = slotList[0]
	ent.onsetComponent  = slotList[1]
	ent.hitComponent    = slotList[2]
	ent.offsetComponent = slotList[3]
	return ent

