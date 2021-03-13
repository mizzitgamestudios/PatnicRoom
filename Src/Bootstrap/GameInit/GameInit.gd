###############################################################################################################################
#                                                                                                                             #
# Klasse:		GameInit                                                                                                      #
# description:	starts the game with varous parameter for debugging,look at L.9                                               #
# data flow:	                                                                                                              #
# often called:	N/A                                                                                                           #
#                                                                                                                             #
###############################################################################################################################
#  Possible Runtime-configs                                                                                                   # 
#                                                                                                                             #
#   default:      starts the game normal,used for Player                                                                      #
#  tilemapTest:  Starts SokraTILEs_TilemapManager for testing of Tilemap rendering                                            #
#  statistics:   collects GameElements in MD-files and starts in default                                                      #
#  restmode:     starts in restMode                                                                                           #
#                                                                                                                             #
#                                                                                                                             #
###############################################################################################################################

extends Node
class_name RuntimeParameter

var settingToUse: String = "statistics";    # <---- WRITE RUNTIME PARAMETER HERE


var startConfig: ConfigFile = ConfigFile.new();
func _ready() -> void:
	API_017_Atlas.sortKitpartsAtlas()

	match settingToUse:
		"default":
			runDefault();
		"tilemapTest":
			runTilemapTest()
		"restmode":
			runRestmode();
		"statistics":
			runStatistics()



#----- DEFAULT -------------------------------------------------------------------##

func runDefault() -> void:
	var settings = {
			"fullscreen":startConfig.get_value("display","window/size/Fullscreen"),
			"displayWidth":startConfig.get_value("display","window/size/width"),
			"displayHeight":startConfig.get_value("display","window/size/height")
			}
	
	ProjectSettings.set_setting("display/window/size/fullscreen",settings["fullscreen"])
	ProjectSettings.set_setting("display/window/size/width",settings["displayWidth"])
	ProjectSettings.set_setting("display/window/size/heigh",settings["displayHeight"])
	
	Gameloop.startTitleMode()



#----- TILEMAP TEST --------------------------------------------------------------##

func runTilemapTest() -> void:
	var jsonParse = Util.JSONParser.fileToDictionary("res://tools/RuntimeConfigs/tilemapTest.json")
	var filepath = jsonParse["filepathToTilemap"]
	
	SokraTiles.parseTilemap(filepath)
	
	get_tree().change_scene("res://Src/scenes/Gameloop/PanicMode/PanicMode.tscn")

	

#----- START IN RESTMODE ---------------------------------------------------------##

func runRestmode() -> void:
	get_tree().change_scene("res://Src/Gameloop_Scenes/RestMode/Init.tscn")



#----- STATISTICS ----------------------------------------------------------------##

func runStatistics():
	var jsonParse = Util.JSONParser.fileToDictionary("res://tools/RuntimeConfigs/statistics.json")

	if jsonParse["kitparts"]:    load("res://tools/Statistics/Kitparts/Main.gd").new().getKitparts()
	
	
	runDefault()
