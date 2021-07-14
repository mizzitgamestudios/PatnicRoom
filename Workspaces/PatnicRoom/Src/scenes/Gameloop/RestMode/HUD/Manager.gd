extends Panel

func _ready() -> void:
	var basepath = "res://Src/scenes/Gameloop/RestMode/"
	
	get_node("char").initialice(basepath+"Self/Charsheet/Charsheet.tscn",ENUM.INPUT_REST.SELF.CHAR)
	get_node("inventory").initialice(basepath+"Self/Inventory/Inventar.tscn",ENUM.INPUT_REST.SELF.INVENTORY)
	get_node("rootnet").initialice(basepath+"Self/Rootnet/Rootnet.tscn",ENUM.INPUT_REST.SELF.ROOTNET)
	
	get_node("workshop").initialice(basepath+"Stations/Station.tscn",ENUM.INPUT_REST.STATION.WORKSHOP)
	get_node("workshop").initialice(basepath+"Stations/Station.tscn",ENUM.INPUT_REST.STATION.WORKSHOP)
	get_node("terminal").initialice(basepath+"Stations/Station.tscn",ENUM.INPUT_REST.STATION.TERMINAL)
	get_node("retreat").initialice(basepath+"Stations/Station.tscn",ENUM.INPUT_REST.STATION.RETREAT)
	
	get_node("panic button/text").initialice("res://Src/scenes/Gameloop/PanicMode/PanicMode.tscn",ENUM.INPUT_REST.SPECIAL.PANIC)


func _input(event: InputEvent) -> void:
	DavINCi.manageInput(event)
