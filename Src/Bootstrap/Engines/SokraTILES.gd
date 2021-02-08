###############################################################################################################################
#                                                                                                                             #
# Klasse:		InitSokraTiles                                                                                                #
# description:	collects all TileSet PNGs and their meta data in dictionary @Atlas_Tileset_Meta                               #
# data flow:	gets all Filepaths to TileSets -> converts JSON to Dictionary -> converts Dictionary to TileEntities          #
#                                                                                                                             #
###############################################################################################################################

extends Node
class_name InitSokraTiles



########################
# --- Init ----------- #
########################
func _init() -> void:
	# TILES
	SokraTiles.actorPositionManager = ActorPositionManager.new()
	# DEBUG
	SokraTiles.tilemapDebug = SokraTILEs_TilemapDebug.new()
		
	# MANAGER ORDERD BY SCOPE
	SokraTiles.tilemanager = SokraTILEs_TileManager.new()
	SokraTiles.tilesetManager = SokraTILEs_TilesetManager.new()
	SokraTiles.layerManager = SokraTILEs_LayerManager.new()
	SokraTiles.tilemapManager = SokraTILEs_TilemapManager.new()


	var allTileSetFilePaths: PoolStringArray = getAllFilepaths();
	for i in allTileSetFilePaths.size():
		parseCurrentTilesetToEntites(allTileSetFilePaths[i])



########################
# --- Main ----------- #
########################
func parseCurrentTilesetToEntites(currentTilesetFilepath):
	var tilesetName: String = getCurrentTileSet(currentTilesetFilepath)
	SokraTiles.Atlas_tileset_Meta[tilesetName] = getDictOfFilepath(currentTilesetFilepath);



########################
# --- Subfunctions --- #
########################
func getDictOfFilepath(filepath:String) -> Dictionary:
	var dictOfTileset: Dictionary = Util.JSONParser.fileToDictionary(filepath);
	var cache = {};
	
	cache["imgFilepath"] = dictOfTileset["image"];
	cache["tilesetName"] = SokraTiles.tilesetManager.getTilesetName(filepath);

	cache["ReferenceStringToEnt"] = getEntityOfTile(filepath);
	
	return cache;


func getEntityOfTile(filepath:String) -> Dictionary:
	var tilesetDict = Util.JSONParser.tilesOfTilesetToDictionary(filepath) 
	return  SokraTiles.tilemanager.parseDictToTileEntity(tilesetDict);



########################
# --- Getter --------- #
########################
func getAllFilepaths() -> PoolStringArray:
	return  SokraTiles.tilesetManager.getAllTileSetPaths()
func getCurrentTileSet(currentFilepath):
	return SokraTiles.tilesetManager.getTilesetName(currentFilepath);


