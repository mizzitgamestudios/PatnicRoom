
# CLASS starts the game for varius Usages                                            

# DOCS  https://mizzitgamestudios.github.io/mkDocs/site/Core/RuntimeParameter        

# BOOKMARK[epic=Singleton] RuntimeParameter                                          

extends Node
class_name RuntimeParameter



# ----- INITIALICE --------------------------------------------------------------- ##


func _ready() -> void:
	
	API_001_Atlas.sortKitpartsAtlas()
	
	var file = File.new()
	file.open("res://tools/gameinit.txt", File.READ)
	var content = file.get_as_text()
	file.close()
	
	print("--- Autoload finished ---")
	print("--- Bootstrap of PatnicRoom/tools/RuntimeConfigs/gameinit.txt: "+content+" ---")

	match content:
		"default"     :			runDefault();
		"tilemapTest" :			runTilemapTest()
		"restmode"    :			runRestmode();
		"statistics"  :			runStatistics()
		"quickStart"  :			runQuickStart()
		"bootMenue"   :			runBootMenue()



# ----- DEFAULT ------------------------------------------------------------------ ##


func runDefault() -> void:
	Gameloop.startTitleMode()



# ----- TILEMAP TEST ------------------------------------------------------------- ##


func runTilemapTest() -> void:
	OS.window_fullscreen = true
	var jsonParse = Util.JSONParser.fileToDictionary("res://tools/RuntimeConfigs/tilemapTest.json")
	var filepath = jsonParse["filepathToTilemap"]
	
	SokraTiles.parseTilemap(filepath)
	
	get_tree().change_scene("res://Src/scenes/Gameloop/PanicMode/PanicMode.tscn")



# ----- START IN RESTMODE -------------------------------------------------------- ##


func runRestmode() -> void:
	OS.window_fullscreen = true
	get_tree().change_scene("res://Src/Gameloop_Scenes/RestMode/Init.tscn")



# ----- STATISTICS --------------------------------------------------------------- ##


func runStatistics():
	OS.window_fullscreen = true
	Statistics_Hub.new().getStatistics()
	get_tree().quit()



# ----- QUICK START -------------------------------------------------------------- ##


func runQuickStart():
	OS.window_fullscreen = true
	var dict           = Util.JSONParser.fileToDictionary("res://config/Savestate/One/Runner/generated/generall and stats.json")
	var quickStartDict = Util.JSONParser.fileToDictionary("res://tools/RuntimeConfigs/quickStart.json")
	
	dict ["Kits"]      = quickStartDict["kit"]
	dict ["race"]      = quickStartDict["race"]
	dict["name"]       = quickStartDict["name"]
	
	API_006_Player.chargenSelecttion = dict
	
	
	API_006_Player.generateNewChar()
	Gameloop.startPanicMode()



# ----- BOOT MENUE --------------------------------------------------------------- ##


func runBootMenue():
	pass

