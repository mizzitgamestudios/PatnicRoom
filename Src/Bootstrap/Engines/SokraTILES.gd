###############################################################################################################################
#                                                                                                                             #
# Klasse:		InitSokraTiles                                                                                                #
# description:	collects all TileSet PNGs and their meta data in dictionary @Atlas_Tileset_Meta                               #
# data flow:	gets all Filepaths to TileSets -> converts JSON to Dictionary -> converts Dictionary to TileEntities          #
# often called:	N/A                                                                                                           #
#                                                                                                                             #
###############################################################################################################################

extends Node
class_name InitSokraTiles



########################
# --- Init ----------- #
########################
func _init() -> void:
	var allTileSetFilePaths: PoolStringArray = getAllFilepaths();
	for i in allTileSetFilePaths.size():

		var currentTilesetFilepath: String = allTileSetFilePaths[i];
		var tilesetName: String = getCurrentTileSet(currentTilesetFilepath)

		SokraTiles.Atlas_tileset_Meta[tilesetName] = getDictOfFilepath(currentTilesetFilepath);



########################
# --- Subfunctions --- #
########################
func getDictOfFilepath(Filepath:String) -> Dictionary:
	var dictOfTileset: Dictionary = Util.JSONParser.fileToDictionary(Filepath);
	var cache = {};
	
	cache["imgFilepath"] = dictOfTileset["image"];
	cache["tilesetName"] = SokraTiles.tilesetManager.getTilesetName(Filepath);
	cache["ReferenceStringToEnt"] = getEntityOfTile(Filepath);
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


