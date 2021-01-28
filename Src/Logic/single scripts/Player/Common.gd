extends Node
class_name Common

var credits:int

func _ready() -> void:
	Player.kitventory = Kitventory.new()
	Player.worldMap = WorldMap.new()
	Player.cloudPrinter = Cloudprinter.new()










