extends Node


var kitcat = ["Cyberwares","Hacks","Drones","Infusions","Spells","Rites","Meeles","Guns","Armors"]
var stringsToWrite = []
var file:File

func _init() -> void:
	file = File.new()
	#writeQuickRef()
	


func writeQuickRef():
	addLine("# Kitparts")

	for i in kitcat.size():
		addLine("- ["+kitcat[i]+"](#"+kitcat[i]+")")



func getKitparts():
	var allKitparts = API_017_Atlas.getKitpartsAtlas().allBasekitGroups
	
	for group in allKitparts.size():
		var currentGroup = allKitparts.values()[group]
		writeGroupTitle(group)
		

		for baseEntry in currentGroup.size():
			var currentKitpart = currentGroup.values()[baseEntry]
			var modsForKitpart = currentKitpart.modArr

			baseKitToDok(currentKitpart.baseKit)
			
			addLine("#### Mods:  ")
			
			for modEntry in modsForKitpart.size():
				var currentMod = modsForKitpart.values()[modEntry]
				
				modKitToDok(currentMod)
			
			addLine(" ")

	writeData()


	
func baseKitToDok(kitpart:KitPartEntity):
	addLine("### "+kitpart.toString())
	addLine("|name|value|")
	addLine("|-|-|")

	addTableRow("description", 			kitpart.decription()        )
	addTableRow("mechanicalSummary", 	kitpart.mechanicalSummary() )
	addTableRow("cooldownTime", 		str(kitpart.cooldownTime()) )
	addTableRow("rarity", 				str(kitpart.rarity())       )
	addTableRow("modTime", 				str(kitpart.modTime())      )


func modKitToDok(kitpart:KitPartEntity):
	addTableRow(kitpart.to_string(), 	kitpart.mechanicalSummary() )



func writeGroupTitle(i):                           addLine("# "+kitcat[i]+"  ")
func addTableRow(descriptor:String,value:String):  addLine("|"+descriptor+"|"+value+"|")

func addLine(content:String):                      stringsToWrite.append(content)



func writeData():
	file.open("res://Documentation/Statistics/Kitparts.md",File.WRITE)
	for i in stringsToWrite.size():
		file.store_line(stringsToWrite[i])
	file.close()
