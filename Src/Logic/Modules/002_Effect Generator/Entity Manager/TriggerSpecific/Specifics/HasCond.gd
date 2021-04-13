extends Object
class_name _Has_Condition



static func run(collectedEnts,condName:String):
	var returnArr = []
	for i in collectedEnts.size():
		var currentLayer = collectedEnts[i]
		
		for j in currentLayer.size():
			var currentEnt = currentLayer[j]

			if currentEnt.hasCond(condName):  returnArr.append(currentEnt)

	return returnArr
