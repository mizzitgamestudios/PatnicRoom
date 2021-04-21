extends Object
class_name _02_TirggerSpecificHub


var operatorCache = ""
func manageSpecificTrigger(ent:KitSetEntity,collectedEnts:Array):
	var returnArray = []
	var specificTrigger = ent.initialSelect["TRIGGER_SPECIFIC"]
	
	var keyword = specificTrigger.metaKeyword
	for i in keyword.size():
		
		
		if keyword[i] == "AND": 
			var currentCollect = appendByKeyword(collectedEnts,specificTrigger,i+1)
			returnArray        = reduceToCommonAnominator(returnArray,currentCollect)
			operatorCache      = ""
		
		
		if keyword[i] == "OR" : 
			var currentCollect = appendByKeyword(collectedEnts,specificTrigger,i+1)
			returnArray += currentCollect
			operatorCache = ""
		
		
		else:
			var currentCollect = appendByKeyword(collectedEnts,specificTrigger,i)
			if i == 0: returnArray = currentCollect
			
			if i+1 < keyword.size():
				if keyword[i+1] == "AND": operatorCache = "AND"
				if keyword[i+1] == "OR": operatorCache = "OR"
		
	return returnArray







func appendByKeyword(collectedEnts,specificTrigger,i):
	var currentCollect = []
	if specificTrigger.metaKeyword.size() > i:
		match specificTrigger.metaKeyword[i]:
			
			"HAS_CONDITION"   :  return _Has_Condition.run(collectedEnts,specificTrigger[0])
			"HAS_STAT"        :  return _Has_StatMod.run(collectedEnts,specificTrigger.metaValue[i])
			"HAS_TEXTURE"     :  return _Has_Texture.run(collectedEnts,specificTrigger.metaValue[i])
			"IS_DOOR"         :  return _Is_Door.run(collectedEnts,specificTrigger.metaValue[i])
			_                 :  return collectedEnts
	else: return []







func reduceToCommonAnominator(returnArray,currentCollect):
	var comnmonArray = []
	
#	for i in currentCollect.size():
#		var currentCollectEntryID = currentCollect[i].get_instance_id()
#		var currentReturnEntryID  = currentCollect[i].get_instance_id()
#
	for i in currentCollect.size():
		var currentCollectEntry = currentCollect[i]
		var objectID = currentCollectEntry.get_instance_id()
		
		for j in returnArray.size():
			var currentReturnEntry = returnArray[j]
			var returnID = currentReturnEntry.get_instance_id()
			
			if returnID == objectID: comnmonArray.append(currentCollectEntry)
	
	return comnmonArray
