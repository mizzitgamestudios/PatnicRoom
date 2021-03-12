extends Node

var background 
var inputmode
var station

var kitSelection : KitSelection
var stationManager
var userinput
func initSubsystems():
	userinput = RestmodeUserinput.new()
	background = Util.RNG.getRngBackground()
	stationManager = StationManager.new()
	kitSelection = KitSelection.new()
	
func initialice():
	inputmode="rest"
	get_tree().change_scene("res://Src/scenes/Gameloop/RestMode/Progression.tscn")
