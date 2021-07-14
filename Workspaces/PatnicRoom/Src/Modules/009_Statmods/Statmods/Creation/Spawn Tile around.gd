extends Object
class_name U_SPAWN_TILE_AROUND


var textureID  : String
var reach      : int

func _init(dictOfPara:Array):
	textureID  = dictOfPara[0][0]
	reach      = int(dictOfPara[0][1])



func getName_quack():      
	return "U_SPAWN_TILE_AROUND"

func getParameter_quack(): 
	return {
		 "textureID"  : textureID
	}

func getValueToString_quack():
	var cache = API_001_Atlas.TileAtlas()[textureID].tileName()
	return "spawn "+cache + " around" +"("+str(reach)+")"

func run(ents):
	for currentEnt in ents:
		var tilesToChange = []
		var ent = SokraTiles.getMeatFloor().getEntByPos_quack( currentEnt.pos() )
		ent     = API_001_Atlas.getTileByTextureID(textureID)
		if !is_instance_valid(ent): ent = instance_from_id(ent)
		
		
		for x in (reach*2)+1:
			for y in (reach*2)+1:
				
				ent         = DemokrECTS.initialiceNewEntry(ent)			
				var pos     = currentEnt.pos()

				var newPosX = int(pos.x) + x - reach
				var newPosY = int(pos.y) + y - reach

				var newPos  = Vector2(newPosX,newPosY)
				ent.setPos(newPos)
				
				
				API_002_Tilemap.replaceEntOnPos(ent,newPos)
				API_002_Tilemap.appendDirtyTiles(ent)





static func getDoc():
	return {
		
		"toShort"          : "spawn Tile around",
		"keyword"          : "U_SPAWN_TILE_AROUND",
		"name"             : "Spawns Tile around",

		"unit"             : "EFFECT",    
		"stat"             : "STAT_MOD",

		"toString"         : "Spawn Tile around by TextureID",

		"inputModule"      : "TEXTURE"

	}
