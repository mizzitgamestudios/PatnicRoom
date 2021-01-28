##########################################################################################################
##  Possible Runtime-configs                                                                            ##
##                                                                                                      ##
##  firstTime:    starts the game like default but with native Systemsettings                           ##
##  default:      starts the game normal,used for Player                                                ##
##  Remarks:                                                                                            ##
##                                                                                                      ##
## ---DEBUG---                                                                                          ##
## tilemapTest:  Starts SokraTILEs_TilemapManager for testing of Tilemap rendering                      ##
## cfgTest:      prints a value of config,changes and prints again                                      ##
## restmode:     starts in restMode                                                                     ##
##                                                                                                      ##
##                                                                                                      ##
##########################################################################################################
extends Node
class_name RuntimeParameter

var settingToUse: String = "default";    # <---- WRITE RUNTIME PARAMETER HERE




var startConfig: ConfigFile = ConfigFile.new();
func _ready() -> void:
	#startConfig.load(getSavePath());
	match settingToUse:
		"firstTime":
			runFirstTime();
		"default":
			runDefault();
		"cfgTest":
			runCfgTest();
		"tilemapTest":
			runTilemapTest("res://Media/TileMap/SuburbanTestSide.json");#<---FILEPATH TO MAP TO DEBUG
		"restmode":
			runRestmode();



func getSavePath() -> String:
	return "res://tools/RuntimeConfigs/"+settingToUse+".cfg";

func saveValueOfConfig(section:String, key:String, value) -> void:
	startConfig.set_value(section,key,value);

func loadValueOfConfig(section:String, key:String) -> int:
	return startConfig.get_value(section,key,"default");







func runDefault() -> void:
	startConfig.load("user://settings.cfg")
	
	var settings = {
			"fullscreen":startConfig.get_value("display","window/size/Fullscreen"),
			"displayWidth":startConfig.get_value("display","window/size/width"),
			"displayHeight":startConfig.get_value("display","window/size/height")
			}
	
	ProjectSettings.set_setting("display/window/size/fullscreen",settings["fullscreen"])
	ProjectSettings.set_setting("display/window/size/width",settings["displayWidth"])
	ProjectSettings.set_setting("display/window/size/heigh",settings["displayHeight"])
	
	Gameloop.startTitleMode()


func runFirstTime() -> void:
	startConfig.load("user://settings.cfg")
	var displayCount: int = OS.get_screen_count()
	var displayWidth: int = OS.get_screen_size().x
	var displayHeight: int = OS.get_screen_size().y
	
	
	var fullscreen: bool
	if displayCount ==1:
		fullscreen=true
	else:
		fullscreen=false
	
	
	var settings = {
		"display":{
			"window/size/Fullscreen":fullscreen,
			"window/size/width":displayWidth,
			"window/size/height":displayHeight
			}
		}
	
	
	for section in settings.keys():
		for key in settings[section]:
			startConfig.set_value(section,key,settings[section][key])
	
	
	startConfig.save("user://settings.cfg")


func runCfgTest() -> void:
	var newVal: int = 4
	var oldval: int
	
	oldval = loadValueOfConfig("value","ausgabe")
	saveValueOfConfig("value","ausgabe",newVal)
	
	oldval = loadValueOfConfig("value","ausgabe")



var boolRunTilemapTest: bool = false
var paraRunTilemapTestFilepathToMap: String
func runTilemapTest(parameter) -> void:
	boolRunTilemapTest = true
	paraRunTilemapTestFilepathToMap = parameter
	get_tree().change_scene("res://Src/scenes/Gameloop/PanicMode/PanicMode.tscn")

func runRestmode() -> void:
	get_tree().change_scene("res://Src/Gameloop_Scenes/RestMode/Init.tscn")
