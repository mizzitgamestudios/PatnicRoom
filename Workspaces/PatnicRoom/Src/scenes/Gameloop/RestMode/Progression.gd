extends Node2D

var background 
var inputmode
var station

var kitSelection 
var stationManager
var userinput



func _init() -> void:
	
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	Gameloop.scene            = self
	Gameloop.scene.background = Util.RNG.getRngBackground()
	
#	stationManager = StationManager.new()
	inputmode="rest"
	DavINCi.initialiceRestScene(self)


func _input(event: InputEvent) -> void: DavINCi.manageInput(event)

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_node("background").texture = Gameloop.scene.background
	




