extends Node
class_name SokraTILEs_TilemapManager

var tilesetManager
var layerManager 
var tilemapParser = SokraTILEs_TilemapParser.new()

func _ready():
	tilesetManager = SokraTiles.tilesetManageR
	layerManager = SokraTiles.layerManager


func initTileMap(filepath):
	#GAMEINIT: tilemapTest
#	if false:#GameInit.boolRunTilemapTest:
#		tilemap=Util.JSONParser.fileToDictionary(GameInit.paraRunTilemapTestFilepathToMap)
#	else:
	SokraTiles.tilemap = Util.JSONParser.fileToDictionary(filepath)





func tileMapCleanUp():
	var tilemap = SokraTiles.tilemap
	var cache={}
	var cleanedtilemap={}
	
	var allTileset=tilemap["tilesets"]
	for i in allTileset.size():
		allTileset[i]=SokraTiles.tilesetManager.getTilesetName(allTileset[i]["source"])
	
	var layering = SokraTiles.layerManager.initLayeringOfMap(tilemap)
	
	cleanedtilemap= {
		"layers":layering,
		"width":tilemap["height"],
		"height":tilemap["width"],
		"tilesets":allTileset,
		}
	SokraTiles.tilemap=cleanedtilemap




func formatTileMap(tilemap):
	var dict = SokraTiles.tilemap
	dict["layers"] = tilemapParser.prepareTilemap("parse1D2D",tilemap)
	dict["layers"] = tilemapParser.prepareTilemap("indexTilemap",tilemap)
	SokraTiles.tilemap=dict
	var test = SokraTiles.tilemap

