extends Object
class_name _02_TirggerSpecificHub



func manageSpecificTrigger(ent:KitSetEntity,collectedEnts:Array):
	var returnArray = []
	var specificTrigger = ent.initialSelect["TRIGGER_SPECIFIC"]
	
	var metaValue = specificTrigger.metaValue
	var keyword = specificTrigger.metaKeyword
	for i in keyword.size():
		match keyword[i]:
			"BASE"            :  returnArray += collectedEnts
			"HAS_CONDITION"   :  returnArray += hasCond(collectedEnts,specificTrigger[0])
			"HAS_STAT"        :  returnArray += hasStat(collectedEnts,metaValue)
			"END_HAS_REACHED" :  return collectedEnts
			"CHANCE"          :  return collectedEnts
			"HAS_TEXTURE"     :  returnArray += hasTexture(collectedEnts,metaValue)
	print(returnArray.size())
	return returnArray




func hasCond(collectedEnts,condName:String):
	var returnArr = []
	for i in collectedEnts.size():
		var currentLayer = collectedEnts[i]
		
		for j in currentLayer.size():
			var currentEnt = currentLayer[j]

			if currentEnt.hasCond(condName):  returnArr.append(currentEnt)

	return returnArr



func hasStat(collectedEnts,metaValue):
	var returnArr = []
	for i in collectedEnts.size():
		var currentLayer = collectedEnts[i]
		var currentEnt = currentLayer
	#	for j in currentLayer.size():
	#		var currentEnt = currentLayer[j]

		for k in metaValue.size():
			var currentComp = metaValue[k][0]
			var operator = metaValue[k][1]
			var comparator = metaValue[k][2]
			
			if currentEnt.has(currentComp):  
				if isComparrissonValid(currentEnt.getCompValue(currentComp),operator,comparator):
					returnArr.append(currentEnt)
			
	return returnArr

func isComparrissonValid(condName:String,operator:String,comparator:String):
	if condName == "Suburban_4_1"and condName == "Suburban_4_0":
		print("debug")
	
	match operator:
		">"  :  return int(condName) >  int(comparator)
		"<"  :  return int(condName) <  int(comparator)
		"==" :  return condName == comparator
		"!=" :  return condName != comparator



func endHasReached():
	pass



func hasTexture(collectedEnts:Array,metaValue):
	var returnArray = []

	for i in metaValue.size():
		var currentTextureToValidate = metaValue[i]

		for j in collectedEnts.size():
			var currentEnt = collectedEnts[j]
			var textureOfEnt = currentEnt.textureID()

			if textureOfEnt == currentTextureToValidate: 
				returnArray.append(currentEnt)

	return returnArray






