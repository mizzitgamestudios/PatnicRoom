extends Object
class_name _TileInterpreter



func interpreteTileNr(pos:Vector2,node:Node) -> bool:
	var meatStaticInteractableMap = SokraTiles.layerManager.getLayer(ENUM.SOKRATILES_LAYER.MEAT_INTERACTABLE)
	var tileID = meatStaticInteractableMap [int(pos.y)] [int(pos.x)]
	if tileID is TileEntity:
		match tileID.textureID():
			"General_2_0":
				var loadedInfo = load("res://Src/scenes/Unique/Enter Restmode Popup/enterRestmode/enterSaveroom.tscn")
				node.get_node("/root").add_child(loadedInfo.instance())
				return false
			
			"dummy":
				pass
	return true











