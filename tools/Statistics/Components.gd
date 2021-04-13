extends Node



var file:File

func _init() -> void:
	file = File.new()

	

var allCompsOfGame: Array = []
func writeJSONForForm():
	var allCompsClass                       = COMP.ATLAS_INDEX_COMP.values()
	var allCompsString                      = COMP.ATLAS_INDEX_COMP.keys()

	for i in allCompsString.size():
		var currentCompString               = allCompsString[i]
		var currentCompClass                = allCompsClass[i]


		var currentCompAutoDoc              = getAutoDoc(currentCompClass,currentCompString)
		currentCompAutoDoc["componentName"] = currentCompString

		allCompsOfGame.append(currentCompAutoDoc)
	
	
	var compDocToJson = JSON.print(allCompsOfGame," ")
	writeData(compDocToJson)




func getAutoDoc(currentCompClass,currentCompString):
	var mockUpDataType = currentCompClass.dioJSONType_quack()
	var currentCompInstance
	
	if   currentCompString == "C_22_ACTOR_LIMITS":  currentCompInstance = currentCompClass.new(0,0,0)
	elif currentCompString == "C_26_ACTOR_INDIRECT_STATS":  currentCompInstance = currentCompClass.new(0,0)
	elif currentCompString == "C_49_EFFECT_REFERENCE":  currentCompInstance = currentCompClass.new(0)
	elif currentCompString == "C_51_PLAYER_KITSETS":  currentCompInstance = currentCompClass.new()
	elif currentCompString == "C_56_BASE_CONNECTOR":  currentCompInstance = currentCompClass.new()
	elif currentCompString == "C_64_APPLY_CONDITION_WALKING":  currentCompInstance = currentCompClass.new("()")
	
	
	else:
		match mockUpDataType:
			"STRING"     : currentCompInstance = currentCompClass.new(""  )
			"INTEGER"    : currentCompInstance = currentCompClass.new(0   )
			"BOOLEAN"    : currentCompInstance = currentCompClass.new(true)
			"ARRAY"      : currentCompInstance = currentCompClass.new([]  )
			"DICTIONARY" : currentCompInstance = currentCompClass.new("N/A")
			"CONTAINER"  : currentCompInstance = currentCompClass.new([]  )
			"NULL"       : currentCompInstance = currentCompClass.new(    )

	return currentCompInstance.autodoc




func writeData(compDocToJson):
	file.open("res://Documentation/Statistics/components.json",File.WRITE)
	file.store_line(compDocToJson)
	file.close()
