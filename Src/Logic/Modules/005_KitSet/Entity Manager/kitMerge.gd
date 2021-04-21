extends Node
class_name _005_KitSetMerger



func mergeKitParts(kitparts:Array) -> KitSetEntity:
	var merge = KitSetEntity.new()

	insertKitpartsInMerge(kitparts,merge)

	getToString(merge)
	getCooldownTime(merge)
	getEffect(merge)
	
	merge.mType = merge.base.mType()

	return merge




func insertKitpartsInMerge(kitparts:Array,merge:KitSetEntity):
	merge.base                                    = kitparts[0]

	if str(kitparts[1]) != "NULL": merge.mod      = kitparts[1]
	if str(kitparts[2]) != "NULL": merge.appendix = kitparts[2]



func getToString(merge:KitSetEntity):
	var validMod      = is_instance_valid(merge.mod)
	var validAppendix = is_instance_valid(merge.appendix) 
	
	if    validMod and  validAppendix :   merge.toString = merge.mod.toString()+" "     +merge.base.toString()+" of "+merge.appendix.toString()
	elif  validMod and !validAppendix :   merge.toString = merge.mod.toString()+" "     +merge.base.toString()
	elif  validMod and  validAppendix :   merge.toString = merge.base.toString()+" of " +merge.appendix.toString()
		
	elif !validMod and !validAppendix :   merge.toString = merge.base.toString()



func getCooldownTime(merge:KitSetEntity):
	var sum = 0
	sum += merge.base.cooldownTime()
	
	if  is_instance_valid(merge.mod):       sum += merge.mod.cooldownTime()
	if  is_instance_valid(merge.appendix):  sum += merge.appendix.cooldownTime()
	
	merge.cooldownTime = sum



func getEffect(merge:KitSetEntity):
	merge.effect = API_002_Effect.createEffectByDict( merge.base.effectReference() )

	if is_instance_valid(merge.mod):         mergeWithKitpart(merge,merge.mod)
	if is_instance_valid(merge.appendix):    mergeWithKitpart(merge,merge.appendix)



func mergeWithKitpart(merge:KitSetEntity,kitpart):
	var statsForChange = kitpart.getCompValue("C_59_KIT_MOD_CHANGE")
	
	for i in statsForChange.size():
		var currentStat = statsForChange[i]

		var slotToChange = API_005_KitSet.getSlot(merge,"KITSET",int(currentStat["unit"]),currentStat["slot"])
		
		match currentStat["mode"]:
			"APPEND" : appendValue( currentStat["value"], slotToChange )
			"REMOVE" : removeValue( currentStat["value"], slotToChange )
			"CAHNGE" : changeValue( currentStat["value"], slotToChange )
			
			"APPEND_BY_OR": 
				slotToChange.metaKeyword.append("OR")
				slotToChange.metaValue.append("OR")
				appendValue(currentStat["value"], slotToChange)
			"APPEND_BY_AND": 
				slotToChange.metaKeyword.append("AND")
				slotToChange.metaValue.append("AND")
				appendValue(currentStat["value"], slotToChange)



func appendValue(values:Array,slotToChange):
	for i in values.size():
		if values[i][0] == "HAS_STAT":
			slotToChange.metaKeyword.append("HAS_STAT")
			slotToChange.metaValue.append(values[i][1])
		
		
		if values.size() == 1:
			values = values[0]
		
		else:
			slotToChange.metaKeyword.append(values[0])
			slotToChange.metaValue.append(values[1])


func removeValue(values:Array,slotToChange):
	slotToChange.metaKeyword.erase(values[0])
	slotToChange.metaValue.erase(values[1])

func changeValue(values:Array,slotToChange):
	var nrKeyword = slotToChange.metaKeyword.find(values[0])
	if nrKeyword is int: slotToChange.metaKeyword[nrKeyword] = values[0]

	var nrValue = slotToChange.metaValue.find(values[1])
	if nrKeyword is int: slotToChange.metaValue[nrValue] = values[1]
