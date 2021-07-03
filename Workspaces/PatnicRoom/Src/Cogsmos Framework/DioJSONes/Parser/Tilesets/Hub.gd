extends Object
class_name TilesetParser



func _init() -> void:
	var allTileSetFilePaths: Array = Util.Filehub.getListOfFilePathsOfDirectory("res://Media/Tilesets/JSON")

	for i in allTileSetFilePaths.size():
		var cache = Util.JSONParser.fileToDictionary(allTileSetFilePaths[i])
		API_001_Atlas.addTileSet(cache["name"], parseTileSetToEntities(cache["tiles"])) 



func parseTileSetToEntities(tileset):
	var entCache 
	var tilesOfTilesetsWithAttributes = {}
	
	for tile in tileset:
		var propertiesCache={}
		for property in tile["properties"].size():
			
			var propertyPair              = tile["properties"][property]
			
			var porpertyName              = ( str(propertyPair["name"]) )
			var porpertyValue             = propertyPair["value"]
			
			propertiesCache[porpertyName] = porpertyValue
			
		
		
		propertiesCache["C_7_TILE_STATIC_TILESET_NR"] = getStaticID(propertiesCache["C_2_ANY_TEXTURE_ID"])
		entCache = DemokrECTS.initialiceNewEntry(propertiesCache)
		
		tilesOfTilesetsWithAttributes[entCache.textureID()] = entCache
		
		
	return tilesOfTilesetsWithAttributes.values()




func getStaticID(textureID):
	var split = textureID.split("_")
	var factor = int(split[1]) * 16
	var single = int(split[2])
	return factor+single
	
	
