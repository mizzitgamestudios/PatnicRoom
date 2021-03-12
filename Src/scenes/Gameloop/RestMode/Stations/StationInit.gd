extends Node2D

func _ready():

	get_node("background").texture=RestMode.background
	
	RestMode.stationManager.manageKitStation(get_node("root_KitBase"))
	

