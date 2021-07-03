
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
	OS.window_fullscreen = true
	Gameloop.startTitleMode()



# ----- TILEMAP TEST ------------------------------------------------------------- ##


func runTilemapTest() -> void:
	OS.window_fullscreen = true
	generateQUickStartChar()
	SokraTiles.parseTilemap("res://config/experimental_tilemap.json")
	get_tree().change_scene("res://Src/scenes/Gameloop/PanicMode/PanicMode.tscn")



# ----- START IN RESTMODE -------------------------------------------------------- ##


func runRestmode() -> void:
	OS.window_fullscreen = true
	generateQUickStartChar()
	Gameloop.startRestMode()



# ----- STATISTICS --------------------------------------------------------------- ##


func runStatistics():
	OS.window_fullscreen = true
	Statistics_Hub.new().getStatistics()
	get_tree().quit()



# ----- QUICK START -------------------------------------------------------------- ##


func runQuickStart():
	OS.window_fullscreen = true
	generateQUickStartChar()
	Gameloop.startPanicMode()



# ----- BOOT MENUE --------------------------------------------------------------- ##


func runBootMenue():
	pass




# ----- HELPER --------------------------------------------------------------- ##


func generateQUickStartChar():
	var dict           = Util.JSONParser.fileToDictionary("res://config/Savestate/One/Runner/generated/generall and stats.json")
	var quickStartDict = Util.JSONParser.fileToDictionary("res://tools/RuntimeConfigs/quickStart.json")
	
	dict ["Kits"]      = quickStartDict["kit"]
	dict ["race"]      = quickStartDict["race"]
	dict["name"]       = quickStartDict["name"]
	
	API_006_Player.chargenSelecttion = dict
	API_001_Atlas.getKitGroup("hack")
	API_006_Player.generateNewChar()



