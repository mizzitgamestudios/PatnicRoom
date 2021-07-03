
extends Node


# ----- INITIALICE ----------------------------------------------------------- ##

var tilemapManager : SokraTILEs_TilemapManager

var tilemap       = {}
var tilemapNode   = {}
var Actors_on_map = {}


func parseTilemap(tileMapFilePath:String):
	tilemapManager.createTilemap(tileMapFilePath)

func createEmptyLayer() -> Dictionary:
	return tilemapManager.tilemapParser.parseEmptyLayer()


func getParsedLayer(layerEnum):
	return getLayer(layerEnum)

func addChunkToKnownLayers(layerEnum,chunkClass):
	tilemapNode[layerEnum] = chunkClass

func setNewTilemap(tilemap:Array): 
	self.tilemap = tilemap

# returns Array of ActorEntities
func getAllActorsOnMap() -> Array :
	return Actors_on_map.values()



# ----- GETTER --------------------------------------------------------------- ##

func getPlayer():			return SokraTiles.getTilemapLayer(ENUM.SOKRATILES.LAYER.ACTOR_PLAYER)
func getActor():			return SokraTiles.getTilemapLayer(ENUM.SOKRATILES.LAYER.ACTOR_NPC)

func getMeatInteract():		return SokraTiles.getTilemapLayer(ENUM.SOKRATILES.LAYER.MEAT_INTERACTABLE)
func getMeatFloor():		return SokraTiles.getTilemapLayer(ENUM.SOKRATILES.LAYER.MEAT_GROUND)

func getMatrixInteract():	return SokraTiles.getTilemapLayer(ENUM.SOKRATILES.LAYER.MATRIX_INTERACTABLE)
func getMatrixFloor():		return SokraTiles.getTilemapLayer(ENUM.SOKRATILES.LAYER.MATRIX_GROUND)

func getMagicInteract():	return SokraTiles.getTilemapLayer(ENUM.SOKRATILES.LAYER.MAGIC_INTERACTABLE)
func getMagicFloor():		return SokraTiles.getTilemapLayer(ENUM.SOKRATILES.LAYER.MAGIC_GROUND)

func getSelection():		return SokraTiles.getTilemapLayer(ENUM.SOKRATILES.LAYER.SELECTION)

func getCondition():		return SokraTiles.getTilemapLayer(ENUM.SOKRATILES.LAYER.CONDITION)

	
func getTilemapLayer(enumOfLayer): return tilemapNode[enumOfLayer]
func getLayer(string:String) -> Dictionary:
	match string:
		"actors"               : return SokraTiles.tilemap[0]
		"pc"                   : return SokraTiles.tilemap[7]
		"Matrix ground"        : return SokraTiles.tilemap[3]
		"Matrix interactables" : return SokraTiles.tilemap[4]
		"Meat ground"          : return SokraTiles.tilemap[1]
		"Meat interactables"   : return SokraTiles.tilemap[2]
		"Magic ground"         : return SokraTiles.tilemap[5]
		"Magic interactables"  : return SokraTiles.tilemap[6]
		"selection"            : return SokraTiles.tilemap[7]
		"condition"            : return SokraTiles.tilemap[8]
	return {}
