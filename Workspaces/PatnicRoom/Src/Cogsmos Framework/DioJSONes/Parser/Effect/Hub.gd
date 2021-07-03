<<<<<<< HEAD

# CLASS                                                                               
# BOOKMARK[epic=Parser] Effect                                                        
extends Node
class_name _002_EntityManager 

=======
extends Node
class_name _002_EntityManager 

var syntax = Effect_Generator_Syntax.new()
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684


func buildEffectProcess(dictOfProperties:Dictionary):
	var allSlots = []
	
<<<<<<< HEAD

	for unit in SYNTAX.EFFECT.UNIT_KEYS.size():
		var currentTimeUnit = selectSlotAndUnit(dictOfProperties,"TIME",unit)

		if isTimeslotNotAvailabe(currentTimeUnit) :    allSlots.append("N/A")
		else                                      :    allSlots.append( setTimeSlot(dictOfProperties,unit) )


	return EffectEntity.new(allSlots)



func setTimeSlot(dictOfProperties,unit):
	var effectSlot = Effect_Unit_Component.new()

	for currentSlotName in SYNTAX.EFFECT.SLOT_KEYS:
		var unitToParse = selectSlotAndUnit(dictOfProperties,currentSlotName,unit)

		match currentSlotName:

			"TIME":
				effectSlot.time            = Effect_Comp_TIME.new(unitToParse)

			"TRIGGER":
				effectSlot.triggerBase     = Effect_Comp_TRIGGER_Base.new(unitToParse["BASE"])
				effectSlot.triggerSpecific = Effect_Comp_TRIGGER_Specific.new(unitToParse["SPECIFIC"])

			"SPACE":
				effectSlot.space           = Effect_Comp_SPACE.new(unitToParse)

			"EFFECT":
				effectSlot.effectStatmod   = Effect_Comp_EFFECT_Statmod.new(unitToParse["STAT_MOD"])
				effectSlot.effectCondition = Effect_Comp_EFFECT_Condition.new(unitToParse["CONDITION"])
	

	return effectSlot



					
func selectSlotAndUnit(dict:Dictionary,slot:String,timeUnit:int):   return dict [slot] [slot+"-"+str(timeUnit)]
func isTimeslotNotAvailabe(currentTimeUnit):                        return  str(currentTimeUnit) == "N/A"


=======
	for unit in syntax.EFFECT_UNIT.size():
		if isTimeslotNotAvailabe(dictOfProperties,unit):  allSlots.append("N/A")
		
		
		if isTimeslotAvailabe(dictOfProperties,unit):
			
			var effectSlot = Effect_Unit_Component.new()
			allSlots.append(effectSlot)
			for slotNr in syntax.EFFECT_SLOT.size():
				
				
				var currentSlotName = syntax.EFFECT_SLOT[slotNr]
				var dictToParse = selectSlotAndUnit(dictOfProperties,currentSlotName,unit)
				
				match currentSlotName:
					"TIME":
						effectSlot.time            = Effect_Comp_TIME.new(dictToParse)
					"TRIGGER":
						effectSlot.triggerBase     = Effect_Comp_TRIGGER_Base.new(dictToParse["BASE"])
						effectSlot.triggerSpecific = Effect_Comp_TRIGGER_Specific.new(dictToParse["SPECIFIC"])
					"SPACE":
						effectSlot.space           = Effect_Comp_SPACE.new(dictToParse)
					"EFFECT":
						effectSlot.effectStatmod   = Effect_Comp_EFFECT_Statmod.new(dictToParse["STAT_MOD"])
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


func isTimeslotNotAvailabe(dictOfProperties,unit):
	return selectSlotAndUnit(dictOfProperties,"TIME",unit) == "N/A"

func isTimeslotAvailabe(dictOfProperties,unit):
	return !selectSlotAndUnit(dictOfProperties,"TIME",unit) == "N/A"
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
