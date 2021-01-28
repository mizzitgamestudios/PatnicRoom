extends Node




func _init() -> void:
	SokraTiles_initManager()
	InitSokraTiles.new();
	InitDioJSONes.new();
	
	InitArisProcgeNes.new();
	DemocrECTS_initManager()
	InitDemokrECTS.new()
	



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
	
