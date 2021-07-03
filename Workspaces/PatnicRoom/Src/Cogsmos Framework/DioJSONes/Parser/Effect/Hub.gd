
# CLASS                                                                               
# BOOKMARK[epic=Parser] Effect                                                        
extends Node
class_name _002_EntityManager 



func buildEffectProcess(dictOfProperties:Dictionary):
	var allSlots = []
	

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


