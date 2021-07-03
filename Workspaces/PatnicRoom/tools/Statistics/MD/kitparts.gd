extends Node
class_name Statistics_MD_Kitparts



static func calcStats():
	var allKitparts    = API_001_Atlas.KitParts().allBasekitGroups
	var kitcat         = ["Cyberwares","Hacks","Drones","Infusions","Spells","Rites","Meeles","Guns","Armors"]
	
	var mdWriter       = MarkdownWriter.new()
	var file           = File.new()


	mdWriter.add_template_title("Kitparts")
	 

	for group in allKitparts.size():
		var currentGroup = allKitparts.values()[group]
	
		mdWriter.add_header(kitcat[group],2)
		

		for baseEntry in currentGroup.size():
			var currentKitpart = currentGroup.values()[baseEntry]

			baseKitToDok(currentKitpart.baseKit,mdWriter)
			mdWriter.add_linebreak()


			

	mdWriter.writeData("res://tools/Statistics/output/Atlas_Kitparts.md")
	





	
static func baseKitToDok(kitpart:KitPartEntity,mdWriter):
	mdWriter.add_header(kitpart.toString(),3)
	mdWriter.create_table(["Stat","Value"])
	
	mdWriter.add_row_table(["description", 		kitpart.decription()        ])
	mdWriter.add_row_table(["mechanicalSummary", 	kitpart.mechanicalSummary() ])
	mdWriter.add_row_table(["cooldownTime", 		str(kitpart.cooldownTime()) ])
	mdWriter.add_row_table(["rarity", 			str(kitpart.rarity())       ])
	mdWriter.add_row_table(["modTime", 			str(kitpart.modTime())      ])







