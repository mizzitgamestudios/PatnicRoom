extends Object
class_name TilesetParser



func _init() -> void:
	var allTileSetFilePaths: Array = Util.Filehub.getListOfFilePathsOfDirectory("res://Media/Tilesets/JSON")
	var debug = []
	for i in allTileSetFilePaths.size():
		var cache = Util.JSONParser.fileToDictionary(allTileSetFilePaths[i])
		API_017_Atlas.Tile().createTileset(cache["name"], parseTileSetToEntities(cache["tiles"])) 



func parseTileSetToEntities(tiles):
	var entCache 
	var tilesOfTilesetsWithAttributes = {}
	var idcache
	
	for tile in tiles:
		var propertiesCache={}
		for i in tile["properties"].size():				
			var property                  = tile["properties"][i]
				
			
			var porpertyName              = ( str(property["name"]) )
			var porpertyValue             = property["value"]
			
			propertiesCache[porpertyName] = porpertyValue

			_cacheTileNrAndID(idcache,tile["id"])
			

		propertiesCache["C_7_TILE_STATIC_TILESET_NR"] = getStaticID(propertiesCache["C_2_ANY_TEXTURE_ID"])
		entCache = DemokrECTS.convertToEntity(propertiesCache)


		tilesOfTilesetsWithAttributes[entCache.textureID()] = entCache

	return tilesOfTilesetsWithAttributes.values()



	


var tileNrInSetCache=[]
var tileIDInSetCache=[]
func _cacheTileNrAndID(ID,TileNr):
	tileNrInSetCache.append(TileNr)
	tileIDInSetCache.append(ID)


func getStaticID(textureID):
	var split = textureID.split("_")
	var factor = int(split[1]) * 16
	var single = int(split[2])
	return factor+single
	
	
