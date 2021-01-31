extends Node
class_name SokraTILEs_TilesetManager

func getAllTileSetPaths() -> PoolStringArray:
	return Util.Filehub.getListOfFilePathsOfDirectory("res://Media/Tilesets/JSON")


func getTilesetName(filepath: String) -> String:
	var splitAtNumberOfTileSet:PoolStringArray = filepath.split("JSON/")
	var nameOfTileSetWithFileTyp:String = splitAtNumberOfTileSet[1]
	
	var splitAtFileType = nameOfTileSetWithFileTyp.split(".json")
	var tileSetName=splitAtFileType[0]
	
	return tileSetName


