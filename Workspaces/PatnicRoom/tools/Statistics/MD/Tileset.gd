extends Node
class_name Statistics_tileset_MD


static func calcTileset(atlas):
	var mdWriter    = MarkdownWriter.new()

	mdWriter.add_header("Tilesets",1)


	
	for tileset in atlas.size():
		var currentTilesetName    = atlas.keys()[tileset]
		var currentTilesetEntries = atlas.values()[tileset]
 

		mdWriter.add_template_title(currentTilesetName)
		mdWriter.create_table(["C_2_ANY_TEXTURE_ID","C_0_ANY_DESCRIPTION"])


		for tile in currentTilesetEntries.size():
			var currentEnt = currentTilesetEntries.values()[tile]

			var index = currentEnt.getCompValue("C_2_ANY_TEXTURE_ID")
			var desc = currentEnt.getCompValue("C_0_ANY_DESCRIPTION")

			mdWriter.add_row_table([index,desc])



	mdWriter.writeData("res://tools/Statistics/output/Atlas_Tilesets.md")


