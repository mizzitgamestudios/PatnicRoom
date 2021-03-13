###############################################################################################################################
#                                                                                                                             #
# Klasse:		--- SokraTILES ---                                                                                         #
# description:	Responsible for the generation of Game-elements,ecspecially Chunks #
#                                                                                                                             #
# data flow:	External JSON -> Tilemap(ActorLayer)                                                                          #
# often called:	N/A                                                                                                           #
#                                                                                                                             #
###############################################################################################################################

extends Node

################################################################################
##  --- Subparts of Engine ---                                                ##
################################################################################

var layerManager : SokraTILEs_LayerManager
var tilemapManager : SokraTILEs_TilemapManager
var tilemapDebug : SokraTILEs_TilemapDebug

func getLayer(string:String) -> Dictionary:
	match string:
		"actors":				return SokraTiles.tilemap[0]
		"pc":					return SokraTiles.tilemap[7]
		"Matrix ground":		return SokraTiles.tilemap[3]
		"Matrix interactables":	return SokraTiles.tilemap[4]
		"Meat ground":			return SokraTiles.tilemap[1]
		"Meat interactables":	return SokraTiles.tilemap[2]
		"Magic ground":			return SokraTiles.tilemap[5]
		"Magic interactables":	return SokraTiles.tilemap[6]
		"selection":			return SokraTiles.tilemap[7]
		"condition":			return SokraTiles.tilemap[8]
	return {}


################################################################################
##  --- Variables ---                                                         ##
################################################################################


var tilemap = {}
var tilemapNode = {}

var Actors_on_map = {}


################################################################################
##  --- Main ---                                                              ##
################################################################################

func parseTilemap(tileMapFilePath:String):
	tilemapManager.createTilemap(tileMapFilePath)

func createEmptyLayer() -> Dictionary:
	return tilemapManager.tilemapParser.parseEmptyLayer()

func getTilemapLayer(enumOfLayer):
	return tilemapNode[enumOfLayer]

func getParsedLayer(layerEnum):
	return getLayer(layerEnum)

func addChunkToKnownLayers(layerEnum,chunkClass):
	tilemapNode[layerEnum] = chunkClass

func setNewTilemap(tilemap:Array):
	self.tilemap = tilemap

# returns Array of ActorEntities
func getAllActorsOnMap() -> Array :
	return Actors_on_map.values()






func getPlayer():
	return SokraTiles.getTilemapLayer(ENUM.SOKRATILES_LAYER.ACTOR_PLAYER)
func getActor():
	return SokraTiles.getTilemapLayer(ENUM.SOKRATILES_LAYER.ACTOR_NPC)

func getMeatInteract():
	return SokraTiles.getTilemapLayer(ENUM.SOKRATILES_LAYER.MEAT_INTERACTABLE)
func getMeatFloor():
	return SokraTiles.getTilemapLayer(ENUM.SOKRATILES_LAYER.MEAT_GROUND)

func getMatrixInteract():
	return SokraTiles.getTilemapLayer(ENUM.SOKRATILES_LAYER.MATRIX_INTERACTABLE)
func getMatrixFloor():
	return SokraTiles.getTilemapLayer(ENUM.SOKRATILES_LAYER.MATRIX_GROUND)

func getMagicInteract():
	return SokraTiles.getTilemapLayer(ENUM.SOKRATILES_LAYER.MAGIC_INTERACTABLE)
func getMagicFloor():
	return SokraTiles.getTilemapLayer(ENUM.SOKRATILES_LAYER.MAGIC_GROUND)

func getSelection():
	return SokraTiles.getTilemapLayer(ENUM.SOKRATILES_LAYER.SELECTION)

func getCondition():
	return SokraTiles.getTilemapLayer(ENUM.SOKRATILES_LAYER.CONDITION)

