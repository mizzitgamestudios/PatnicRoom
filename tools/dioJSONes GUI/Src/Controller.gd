extends Node


func appendFormByTypeRequirements(typeString,nodeOfBasicZone):
	Conventions.numberOfReqirements = Conventions.typeRequirements[typeString].size()
	
	createTypePanel(typeString,nodeOfBasicZone)
	createTypeEntries(typeString,nodeOfBasicZone)



func createTypePanel(typeString,nodeOfBasicZone):
	var origin = Vector2(0,352)
	var end = PanelConstructor.calculatePanelSize(Conventions.numberOfReqirements)
	nodeOfBasicZone.get_node("../typical fields text").visible=true
	
	PanelConstructor.createPanel(origin,end,StyleConstructor.createZoneStyle(),nodeOfBasicZone)



func createTypeEntries(typeString,nodeOfBasicZone):
	var typePanelNode = nodeOfBasicZone.get_node("../typeRequirements")
	var origin = typePanelNode.get_position()
	origin.x += 8
	
	var keysOfType = Conventions.typeRequirements[typeString].keys()
	var TooltipsOfkeys = Conventions.typeRequirements[typeString].values()
	
	
	for j in Conventions.typeRequirements[typeString].size():
		origin.y += PanelConstructor.padding
		
		var entryInstance = EntryConstructor.entryPreload.instance()
		EntryConstructor.create(origin,keysOfType[j],TooltipsOfkeys[j],entryInstance,nodeOfBasicZone.get_node(".."))
		origin.y += EntryConstructor.sizeHeight
		


func fileToDictionary(filepath):                                                          #parses file of JSON to dictionary
	var fileToDictionaryFile = File.new()
	fileToDictionaryFile.open(filepath,File.READ)
	var fileToDictionaryJSON = JSON.parse(fileToDictionaryFile.get_as_text())
	fileToDictionaryFile.close()
	
	return fileToDictionaryJSON.result



func checkForm(node):
	pass
