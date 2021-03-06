extends Object
class_name _005_Get


var syntax = SYNTAX.EFFECT

func getSlot(kitset:KitSetEntity,kitPart:String,unit:int,slot:String):
	match slot:
		"TIME"             : return getUnit(kitset,kitPart,unit).time
		"SPACE"            : return getUnit(kitset,kitPart,unit).space
		"TRIGGER_BASE"     : return getUnit(kitset,kitPart,unit).triggerBase
		"EFFECT_STAT_MOD"  : return getUnit(kitset,kitPart,unit).effectStatmod
		"TRIGGER_SPECIFIC" : return getUnit(kitset,kitPart,unit).triggerSpecific
		"EFFECT_CONDITION" : return getUnit(kitset,kitPart,unit).effectCondition




func getUnit(kitset:KitSetEntity,kitPart:String,unit:int):
	var unitToString = syntax.UNIT_KEYS[int(unit)]
	match unitToString:
		"HIT"             : return getKitPart(kitset,kitPart).effect.hitComponent
		"SPAWN"           : return getKitPart(kitset,kitPart).effect.spawnComponent
		"ONSET"           : return getKitPart(kitset,kitPart).effect.onsetComponent
		"OFFSET"          : return getKitPart(kitset,kitPart).effect.offsetComponent




func getKitPart(kitset:KitSetEntity,kitPart:String):
	match kitPart:
		"MOD"             :	return kitset.mod
		"BASE"            :	return kitset.base
		"APPENDIX"        :	return kitset.appendix
		"KITSET"          : return kitset


