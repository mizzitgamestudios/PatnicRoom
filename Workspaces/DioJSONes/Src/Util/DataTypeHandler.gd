extends Node
class_name DataTypeHandler

func getDataToString(dataType:String):
	match(dataType):
		"STRING"     : return "(Text)"
		"INTEGER"    : return "(whole Number)"
		"ARRAY"      : return "(List)"
		"DICTIONARY" : return "(group)"
		"BOOLEAN"    : return "true false"

func getStyle(dataType:String):
	match(dataType):
		"STRING"     : return load("res://Media/presets/IntegerInput.tres") 
		"ARRAY"      : return load("res://Media/presets/IntegerInput.tres") 
		"INTEGER"    : return load("res://Media/presets/StringInput.tres")
		"DICTIONARY" : return load("res://Media/presets/IntegerInput.tres") 
		"BOOLEAN"    : return load("res://Media/presets/IntegerInput.tres")



func getWidth(dataType:String):
	match(dataType):
		"STRING"     : return 500
		"INTEGER"    : return 200
		"ARRAY"      : return 500
		"DICTIONARY" : return 500
		"BOOLEAN"    : return 100



func getCompDocsOfArray(compsArr:Array):
	var compIndex = Utils.fileToDictionary("res://config/components.json")
	var docs = []
	
	for i in compsArr.size():
		var currentComp = compsArr[i]
		
		for j in compIndex.size():
			var currentDoc = compIndex[j]
			
			if currentComp == currentDoc["componentName"]:
				docs.append(currentDoc)
	
	return docs



