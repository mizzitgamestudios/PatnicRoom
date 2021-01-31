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
var tilesetManager : SokraTILEs_TilesetManager
var tilemanager : SokraTILEs_TileManager
var tilemapManager : SokraTILEs_TilemapManager
var tilemapDebug : SokraTILEs_TilemapDebug
var actorPositionManager : ActorPositionManager



################################################################################
##  --- Variables ---                                                         ##
################################################################################

var platonicHeaven
var tilemap

var Atlas_tileset_Meta = {}



################################################################################
##  --- Main ---                                                              ##
################################################################################

func parseTilemap(tileMapFilePath:String):
	tilemapManager.initTileMap(tileMapFilePath)
	tilemapManager.tileMapCleanUp()
	tilemapManager.formatTileMap(tilemap)


func moveActor(ent:Entity,direction:int):
	match direction:
		1:
			pass 
		2:
			pass
		3:
			pass
		4:
			pass




