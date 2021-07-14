extends Object
class_name _TileInterpreter



func interpreteTileNr(pos:Vector2,node:Node) -> bool:
	var meatStatic = SokraTiles.getMeatInteract()
	var tileID = meatStatic.getEntByPos_quack(pos)

	if tileID is InteractEntity:
		match tileID.textureID():
	
			"General_2_0":
				Gameloop.startRestMode()
				var loadedInfo = load("res://Src/scenes/Unique/Enter Restmode Popup/enterRestmode/enterSaveroom.tscn")
				node.get_node("/root").add_child(loadedInfo.instance())
				return false
	
				
			"dummy":
				pass
	
	return true











