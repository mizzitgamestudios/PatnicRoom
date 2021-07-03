extends Object
class_name U_SPAWN_TILE


var textureID  : String

func _init(dictOfPara:Array):
	textureID  = dictOfPara[0]



func getName_quack():      
	return "U_SPAWN_TILE"

func getParameter_quack(): 
	return {
		 "textureID"  : textureID
	}
func getValueToString_quack():
	var cache = COMP.GET_COMPONENT(textureID).getAutoDoc()["nameToShow"]
	return cache 


func run(ent):
	var newEnt = API_001_Atlas.getTileByTextureID(textureID)
	

	API_002_Tilemap.replaceEntOnPos(newEnt,ent.pos())
	API_002_Tilemap.appendDirtyTiles(newEnt)




	
 
static func getDoc():
	return {
		
		"toShort"          : "spawn Tile",
		"keyword"          : "U_SPAWN_TILE",
		"name"             : "Spawns Tile",

		"unit"             : "EFFECT",    
		"stat"             : "STAT_MOD",

		"toString"         : "Spawn Tile by TextureID",

		"inputModule"      : "TEXTURE"

	}
