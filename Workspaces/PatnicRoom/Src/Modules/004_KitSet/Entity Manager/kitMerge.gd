extends Node
class_name _005_KitSetMerger


# ----- MAIN --------------------------------------------------------------------- ##


func mergeKitParts(kitparts:Array) -> KitSetEntity:
	var kitset = KitSetEntity.new()
	setKitpartsOfMerge(kitparts,kitset)

	kitset.mType        = getMType(kitset)
	kitset.cooldownTime = getCooldownTime(kitset)
	kitset.toString     = getToString(kitset)
	kitset.effect       = getEffect(kitset)

	API_004_KitSet.getInitialKitsetSelect(kitset)
	return kitset


func setKitpartsOfMerge(kitparts:Array,kitset:KitSetEntity):
	kitset.base = kitparts[0]

	if str(kitparts[1]) != "NULL": kitset.mod = kitparts[1]
	else: kitset.mod = null

	if str(kitparts[2]) != "NULL": kitset.appendix = kitparts[2]
	else: kitset.appendix = null



# ----- GETTER ------------------------------------------------------------------- ##


func getMType(kitset:KitSetEntity):
	return kitset.base.mType()

	
func getCooldownTime(kitset:KitSetEntity):
	var sum = 0
	if is_instance_valid(kitset.mod)      : sum += kitset.mod.cooldownTime()
	if is_instance_valid(kitset.base)     : sum += kitset.base.cooldownTime() 
	if is_instance_valid(kitset.appendix) : sum += kitset.appendix.cooldownTime()
	return sum


func getToString(kitset:KitSetEntity):
	var kitToString = ""
	if is_instance_valid(kitset.mod)      : kitToString +=          "["+kitset.mod.toString()      + "] "
	if is_instance_valid(kitset.base)     : kitToString +=          "["+kitset.base.toString()     + "] "
	if is_instance_valid(kitset.appendix) : kitToString += " of [" + kitset.appendix.toString()+ "] "
	return kitToString


func getEffect(kitset:KitSetEntity):
	if is_instance_valid(kitset.base)     : kitset.effect = kitset.base.effectReference() 
	if is_instance_valid(kitset.mod)      : mergeWithKitpart(kitset.mod      , kitset)
	if is_instance_valid(kitset.appendix) : mergeWithKitpart(kitset.appendix , kitset)
	return kitset.effect



# ----- MODIFIER HUB ------------------------------------------------------------- ##


func mergeWithKitpart(kitPart:KitPartEntity, kitSet:KitSetEntity):
	for currentStatDict in kitPart.getCompValue("C_59_KIT_MOD_CHANGE"):
		var stat = StatsToModify.new(currentStatDict,kitSet)

		match stat.mode:
			"APPEND_BY_OR"  :   appendWithOperator("OR", stat)
			"APPEND_BY_AND" :   appendWithOperator("AND", stat)

			"APPEND"        :          appendMerge(stat)
			"REMOVE"        :          removeMerge(stat)
			"CHANGE"        :          changeMerge(stat)



class StatsToModify:
	var mode ; var meta ; var value ; var slot
	
	func _init(currentStatPara:Dictionary, kitsetPara:KitSetEntity):
		var slotNr          = currentStatPara["slot"]
		var unitNr          = currentStatPara["unit"]
		var cachedValuePair = currentStatPara["value"][0]

		mode   = currentStatPara["mode"]
		meta   = cachedValuePair[0]
		value  = cachedValuePair[1]
		slot   = API_004_KitSet.getSlot(kitsetPara, "KITSET", int(unitNr), slotNr)



# ----- MODIFIER METHODS --------------------------------------------------------- ##


func appendMerge(statsToMerge:StatsToModify):
	var keywords = SYNTAX.EFFECT().TRIGGER.SPECIFIC
	
	var meta  = statsToMerge.meta
	var value = statsToMerge.value
	
	var keywordInstance = keywords[meta].new( [value] )
	statsToMerge.slot.specificTriggers.append(keywordInstance)



func removeMerge(statsToMerge:StatsToModify):
	statsToMerge.slot.metaKeyword.erase(statsToMerge.meta)
	statsToMerge.slot.metaValue.erase(statsToMerge.value)


func changeMerge(statsToMerge:StatsToModify):
	var cacheMeta = statsToMerge.slot.metaKeyword.find(statsToMerge.meta)
	if cacheMeta is int : statsToMerge.slot.metaKeyword[cacheMeta] = statsToMerge.meta
	
	var cacheValue = statsToMerge.slot.metaValue.find(statsToMerge.value)
	if cacheValue is int : statsToMerge.slot.metaValue[cacheValue] = statsToMerge.value



func appendWithOperator(operator:String,statsToMerge:StatsToModify):
	statsToMerge.slot.specificTriggers.append(operator)
	appendMerge(statsToMerge)





