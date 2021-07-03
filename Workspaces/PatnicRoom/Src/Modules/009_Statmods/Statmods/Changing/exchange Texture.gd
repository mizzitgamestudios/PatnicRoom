extends Object
class_name U_EXCHANGE_TEXTURE


func _init(dictOfPara:Array):pass


func getValueToString_quack():   return "change to alternate Texture"
func getName_quack():            return "U_EXCHANGE_TEXTURE"

func getParameter_quack(): 
	return {}


func run(ent):
	for currentEnt in ent:
		var textureToChange = currentEnt.getCompValue("C_58_ALTERNATIVE_TEXTURES")
		var currentTexture  = currentEnt.getCompValue("C_2_ANY_TEXTURE_ID")

		currentEnt.getComp("C_58_ALTERNATIVE_TEXTURES").value = currentTexture
		currentEnt.getComp("C_2_ANY_TEXTURE_ID").value        = textureToChange

		API_002_Tilemap.appendDirtyTiles(currentEnt)



static func closeTierOne(ent, modValue=0):
	return true



static func closeTierTwo(ent):
	return true



static func getDoc():
	return {
		
		"toShort"          : "alter Texture",
		"keyword"          : "U_EXCHANGE_TEXTURE",
		"name"             : "exchange Texture",

		"unit"             : "EFFECT",    
		"stat"             : "STAT_MOD",

		"toString"         : "Change Texture to C_58_ALTERNATIVE_TEXTURES",

		"inputModule"      : "BOOL"

	}
