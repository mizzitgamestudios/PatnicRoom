extends Node
class_name Statistics_tileset_MD


<<<<<<< HEAD
static func calcStats():
	var mdWriter    = MarkdownWriter.new()
	var atlas       = API_001_Atlas.TileSetAtlas()
=======
static func calcTileset(atlas):
	var mdWriter    = MarkdownWriter.new()
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684

	mdWriter.add_header("Tilesets",1)


	
	for tileset in atlas.size():
		var currentTilesetName    = atlas.keys()[tileset]
		var currentTilesetEntries = atlas.values()[tileset]
 

		mdWriter.add_template_title(currentTilesetName)
<<<<<<< HEAD
		mdWriter.create_table(["C_2_ANY_TEXTURE_ID","C_6_TILE_NAME","C_0_ANY_DESCRIPTION"])
=======
		mdWriter.create_table(["C_2_ANY_TEXTURE_ID","C_0_ANY_DESCRIPTION"])
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684


		for tile in currentTilesetEntries.size():
			var currentEnt = currentTilesetEntries.values()[tile]

			var index = currentEnt.getCompValue("C_2_ANY_TEXTURE_ID")
<<<<<<< HEAD
			var name = currentEnt.getCompValue("C_6_TILE_NAME")
			var desc = currentEnt.getCompValue("C_0_ANY_DESCRIPTION")

			mdWriter.add_row_table([index,name,desc])
=======
			var desc = currentEnt.getCompValue("C_0_ANY_DESCRIPTION")

			mdWriter.add_row_table([index,desc])
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684



	mdWriter.writeData("res://tools/Statistics/output/Atlas_Tilesets.md")


