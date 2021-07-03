extends Node
class_name Statistics_enum_MD






static func calcStats():
	var mdWriter = MarkdownWriter.new()

	var cacheString = ENUM.allEnumsToString
	var cacheDict   = ENUM.allEnums

	for string in cacheString:
		var currentEntry = cacheDict[string]
		actByType(currentEntry,string,mdWriter)
	
	
	mdWriter.writeData("res://tools/Statistics/output/Atlas_Enum.md")





static func actByType(entry,string,mdWriter):
	var exception = ["RARITY_TO_STRING","PROGRESS_COLOR","ENTROPY_TO_STRING"]
	if exception.has(string)           : writeList(entry.values(),string,mdWriter)
	
	
	elif entry is String:       writeString(string,entry,mdWriter)
	elif entry is int:          writeString(string,str(entry),mdWriter)
	elif entry is Vector2:      writeVector(entry,string,mdWriter)
	elif entry is Dictionary:   writeList(entry.keys(),string,mdWriter)
	


static func writeVector(entry,string,mdWriter):
	var vectorToString =""
	vectorToString += "X: "
	vectorToString += str(entry.x)
	vectorToString += " Y: "
	vectorToString += str(entry.y)
	writeString(string,vectorToString,mdWriter)



static func writeString(entry,string,mdWriter):
	mdWriter.add_header(entry,3)
	mdWriter.add_content_new_line(string)




static func writeList(list,name,mdWriter):
	mdWriter.add_header(name,3)
	for i in list.size():
		mdWriter.add_content_new_line(str(i)+". "+str(list[i]))

static func writeListComp(list,name,mdWriter):
	mdWriter.add_header(name,3)
	for i in list.size():
		mdWriter.add_content_new_line(str(i)+". "+str(list[i].name_quack()))
