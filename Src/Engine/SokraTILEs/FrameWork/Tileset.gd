extends Node
class_name SokraTILEs_TilesetManager

func getAllTileSetPaths() -> PoolStringArray:
	return Util.Filehub.getListOfFilePathsOfDirectory("res://Media/Tilesets/JSON")


func getTilesetName(filepath: String) -> String:
	var splitAtNumberOfTileSet =filepath.split("JSON/")
	var nameOfTileSetWithFileTyp=splitAtNumberOfTileSet[1]
	
	var splitAtFileType=nameOfTileSetWithFileTyp.split(".json")
	var tileSetName=splitAtFileType[0]
	
	return tileSetName

var tilesetName

func getTileSetNameById(tileId):
	var split = tileId.split("_")
	var tilesets = SokraTiles.Atlas_tileset_Order
	for i in tilesets.size():
		var currentTilesetName = tilesets[i]
		if split[0] in currentTilesetName:
			return currentTilesetName










