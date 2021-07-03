extends DemokrECTS_Atlas
class_name _17_Tiles


# ----- INITIALICE ----------------------------------------------------------- ##


var atlas_Tilesets = {}


func _init() -> void:
	classOfEntries = TileEntity
	indexComponent = C_2_ANY_TEXTURE_ID.name_quack()



# ----- SETTER --------------------------------------------------------------- ##


func createTileset(tileset:String,tiles:Array):
	atlas_Tilesets[tileset] = tiles
	var dictOfTileset = {}
	
	for i in tiles.size():
		var currentTile = tiles[i]
		var currentTileName = currentTile.getCompValue(indexComponent)
		
		atlas_Entry[currentTileName] = tiles[i]
		dictOfTileset[currentTileName] = tiles[i]
	
	
	atlas_Tilesets[tileset]=dictOfTileset




















