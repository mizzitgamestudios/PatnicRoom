extends Object
class_name _Has_Texture



static func run(collectedEnts:Array,metaValue):
	var returnArray = []

	for currentEnt in collectedEnts:
		var textureOfEnt = currentEnt.textureID()

		if textureOfEnt == metaValue: returnArray.append(currentEnt)

	return returnArray



static func getDoc():
	return {
		
		"keyword"          : "HAS_TEXTURE",
		"name"             : "has texture",

		"unit"             : "TRIGGER",    
		"stat"             : "SPECIFIC",

		"to stirng"        : "if it has the textureID (put together by tileset-name,x,y)",

		"module reference" : "TEXTURE"

	}