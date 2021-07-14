extends Node
class_name Statistics_atlas_MD



static func calcStats(atlasPara,typePara,filepath):
	var mdWriter = MarkdownWriter.new()
	mdWriter.add_template_title("Atlas "+typePara)


	for entry in atlasPara.values():
		createTitleForEntry(entry,mdWriter)
		createTableForEntry(entry,mdWriter)


	mdWriter.writeData(filepath)




static func createTitleForEntry(entry,mdWriter):
	var entryTitle = entry.getCompValue("C_6_TILE_NAME")
	mdWriter.add_header(entryTitle,3)




static func createTableForEntry(entry,mdWriter):
	for stat in entry.dictOfComps.values():

		var statName  = stat.name_quack()
		var statvalue = stat.value

		mdWriter.create_table(["Statname","Value"])
		mdWriter.add_row_table([statName,statvalue])














