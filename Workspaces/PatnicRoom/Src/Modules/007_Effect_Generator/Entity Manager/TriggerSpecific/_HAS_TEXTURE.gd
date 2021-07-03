extends Object
class_name Effect_Trigger_Specific_Has_Texture


var textureID  : String

func _init(dictOfPara:Array):
	textureID  = dictOfPara[0]



func getName_quack():      
	return "HAS_TEXTURE"

func getParameter_quack(): 
	return {
		 "textureID"  : textureID
	}

func getValueToString_quack():
	var cache = API_001_Atlas.TileAtlas[textureID].name()
	return "has "+cache

func run(collectedEnts:Array):
	var returnArray = []

	for currentEnt in collectedEnts:
		if currentEnt.textureID() == textureID: returnArray.append(currentEnt)

	return returnArray





static func getDoc():
	return {
		
		"keyword"          : "HAS_TEXTURE",
		"name"             : "has texture",

		"unit"             : "TRIGGER",    
		"stat"             : "SPECIFIC",

		"toString"        : "if it has the textureID (put together by tileset-name,x,y)",

		"inputModule" : "TEXTURE"

	}
