extends Node
class_name _005_KitSetMerger



func mergeKitParts(kitparts:Array) -> KitSetEntity:
	var merge = KitSetEntity.new()
	 
	merge.toString = generateMergeToString(kitparts[0],kitparts[1],kitparts[2])
	merge.cooldownTime = getCooldownTime(kitparts[0],kitparts[1],kitparts[2])
	merge.base = kitparts[0]
	merge.mType =  kitparts[0].mType()

	
	if str(kitparts[1]) != "NULL":
		merge.mod = kitparts[1]
	if str(kitparts[2]) != "NULL":
		merge.appendix = kitparts[2]
	
	merge.base.effect = API_002_Effect.createEffectByDict(merge.base.effectReference())

	return merge




	
func constructByArrayKitPart(array:Array):
	var arr = ["NULL","NULL","NULL"]
	
	for i in array.size():
		if str(array[i]) != "NULL" : arr[i] = DemokrECTS.searchKeyword(array[i])
	return arr



func generateMergeToString(base,mod,appendix):
	if str(appendix) != "NULL" and str(mod) != "NULL": return mod.toString()+" "+base.toString()
	if str(appendix) != "NULL" and str(mod) == "NULL": return base.toString()+" of "+appendix.toString()
	if str(appendix) == "NULL" and str(mod) == "NULL": return base.toString()
	else:
		return mod.toString()+" "+base.toString()+" of "+appendix.toString()


func getCooldownTime(base,mod,appendix):
	var sum = 0
	sum += base.cooldownTime()
	
	if str(mod) != "NULL":
		sum += mod.cooldownTime.value
	if str(appendix) != "NULL":
		sum += appendix.cooldownTime.value
	
	return sum






