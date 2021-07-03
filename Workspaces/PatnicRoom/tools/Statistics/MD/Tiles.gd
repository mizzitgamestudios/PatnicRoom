extends Node
class_name Statistics_Tiles_MD


static func calcStats():
	
	var atlas       = API_001_Atlas.TileAtlas()


	for tile in atlas.size():
		var mdWriter    = MarkdownWriter.new()
		var currentTileName = atlas.keys()[tile]	
		var currentTile     = atlas.values()[tile]
		var compsOfTile     = currentTile.dictOfComps
		
		
		mdWriter.add_template_title(currentTileName)
		mdWriter.create_table(["Component","Value"])
		
		
		for currentComponent in compsOfTile.values():
			var componentName = currentComponent.name_quack()
			var value = currentComponent.value
		
			mdWriter.add_row_table([componentName,value])
		
		mdWriter.writeData("res://tools/Statistics/output/tiles/"+currentTileName+".md")


