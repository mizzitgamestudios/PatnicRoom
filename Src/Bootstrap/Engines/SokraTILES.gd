extends Node
class_name InitSokraTiles


func _init() -> void:
	var allTileSetFilePaths: PoolStringArray = SokraTiles.tilesetManager.getAllTileSetPaths();
	
	for i in allTileSetFilePaths.size():
		var currentTilesetFilePath: String = allTileSetFilePaths[i];
		var tilsetName: String = SokraTiles.tilesetManager.getTilesetName(currentTilesetFilePath);
		
		SokraTiles.Atlas_tiles_Attributes[tilsetName] = subSystemTileAttributes(currentTilesetFilePath);
		SokraTiles.Atlas_tileset_Meta[tilsetName] = subSystemTileSet(currentTilesetFilePath,i);
		#SokraTiles.Atlas_tileset_Meta[tilsetName] = subSystemTileSet(currentTilesetFilePath,i);



func subSystemTileSet(Filepath:String, i:int) -> Dictionary:
	var dictOfTileset: Dictionary = Util.JSONParser.fileToDictionary(Filepath);
	SokraTiles.Atlas_tileset_Order[i]=SokraTiles.tilesetManager.getTilesetName(Filepath);
	var cache={};
	cache["imgFilePath"] = dictOfTileset["image"];
	cache["tilesetName"] = SokraTiles.tilesetManager.getTilesetName(Filepath);
	cache["ReferenceNrToString"] = SokraTiles.tilemanager.getTileNrAndIDOfLocalCache();
	cache["ReferenceStringToEnt"] =subSystemTileAttributes(Filepath);
	#TODO : möglciherweise NRTOSTRING ÜBERSPRINGBAR DURCH NRTOENT
	return cache;



func subSystemTileAttributes(filepath:String) -> Dictionary:
	var tilesOfTileset = Util.JSONParser.tilesOfTilesetToDictionary(filepath) ;
	var tileAttributesOfTilesOfTileset =  SokraTiles.tilemanager.appendTileAttributeAtlas(tilesOfTileset);
	return tileAttributesOfTilesOfTileset;


