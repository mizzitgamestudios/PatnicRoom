###############################################################################################################################
#                                                                                                                             #
# Klasse:		Bootstrap                                                                                                     #
# description:	starts up the 4 Engines to initialice them their needed data to start a game-routine                          #
#                                                                                                                             #
# data flow:	                                                                                                              #
# often called:	N/A                                                                                                           #
#                                                                                                                             #
###############################################################################################################################

extends Node



########################
# --- Init ----------- #
########################
func _init() -> void:
	SokraTiles_initManager()
	DemocrECTS_initManager()
	
	InitSokraTiles.new()
	InitDioJSONes.new()
	


########################
# --- Suvfunctions --- #
########################
func SokraTiles_initManager():
	# TILES
	SokraTiles.actorPositionManager = ActorPositionManager.new()
	# DEBUG
	SokraTiles.tilemapDebug = SokraTILEs_TilemapDebug.new()
	
	# MANAGER ORDERD BY SCOPE
	SokraTiles.tilemanager = SokraTILEs_TileManager.new()
	SokraTiles.tilesetManager = SokraTILEs_TilesetManager.new()
	SokraTiles.layerManager = SokraTILEs_LayerManager.new()
	SokraTiles.tilemapManager = SokraTILEs_TilemapManager.new()

func DemocrECTS_initManager():
	DemokrECTS.performanceManager = PerformanceManager.new()
	DemokrECTS.tileEntManager = TileEntManager.new()
	
	# MANAGER ORDERD BY SCOPE
	DemokrECTS.entityManager = EntityManager.new()
	DemokrECTS.componentManager = ComponentManager.new()

	DemokrECTS.systemManager = SystemManager.new()
	
