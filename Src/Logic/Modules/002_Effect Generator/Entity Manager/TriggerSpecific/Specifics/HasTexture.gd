extends Object
class_name _Has_Texture



static func run(collectedEnts:Array,metaValue):
	var returnArray = []

	for j in collectedEnts.size():
		var currentEnt = collectedEnts[j]
		var textureOfEnt = currentEnt.textureID()

		if textureOfEnt == metaValue: 
			returnArray.append(currentEnt)

	return returnArray