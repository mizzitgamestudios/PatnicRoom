extends Node
class_name InitSokraTiles


func _init() -> void:
	SokraTiles.tilemapManager = SokraTILEs_TilemapManager.new()
	SokraTiles.tilemapManager = SokraTILEs_TilemapManager.new()
	
	#initialiceAllTilesets()


#
##----- TILESETS INIT --------------------------------------------------------##
#
#func initialiceAllTilesets() -> void:
#	var allTileSetFilePaths: PoolStringArray = getAllFilepaths()
#
#	for i in allTileSetFilePaths.size():
#		parseCurrentTilesetToEntites(allTileSetFilePaths[i])
#
#
## ---- BUILDS TILESET ENTRY ---- #
#func parseCurrentTilesetToEntites(currentTilesetFilepath) -> void:
#	var tilesetName: String = getTilesetName(currentTilesetFilepath)
#	SokraTiles.Atlas_tileset_Meta[tilesetName] = getDictOfTileset(currentTilesetFilepath);
#
#
#
#
## ---- BUILD METAINFO OF TILESET ---- #
#func getDictOfTileset(filepath:String) -> Dictionary:
#	var dictOfTileset: Dictionary = Util.JSONParser.fileToDictionary(filepath);
#	var cache = {};
#
#	cache["imgFilepath"] = dictOfTileset["image"];
#	cache["tilesetName"] = SokraTiles.tilesetManager.getTilesetName(filepath);
#	cache["ReferenceStringToEnt"] = convertTilesetDictToEntities(filepath);
#
#	return cache;
#
#
## ---- BUILD TILE_ENTITIES ---- #
#func convertTilesetDictToEntities(filepath:String) -> Dictionary:
#	var tilesetDict = Util.JSONParser.tilesOfTilesetToDictionary(filepath) 
#	return  SokraTiles.tilemanager.parseDictToTileEntity(tilesetDict);
#
#
#
#
## ---- GETTER ---- #
#func getAllFilepaths() -> PoolStringArray:
#	return  Util.Filehub.getListOfFilePathsOfDirectory("res://Media/Tilesets/JSON")



