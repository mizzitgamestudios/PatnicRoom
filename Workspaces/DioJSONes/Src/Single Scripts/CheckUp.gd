extends Node

var allNodesOfForms = {}
var listOfValidAttributes = []



func fullCheckUp():
	var isAlertless = false
	for i in Parser.componentsAttributesClasses.size():
		
		var currentEntry = Parser.componentsAttributesClasses[i]
		var entryClass = validityOfEntry.new()
		entryClass.initialice(currentEntry)
		
		if currentEntry.validInputs.size() > 0:  checkForValidOption(entryClass)
		else:                                    checkForValidDataType(entryClass)
		
		
		var sceneToLoad
		if entryClass.isValid != true:
			isAlertless = true
			sceneToLoad = load("res://Media/presets/alert.tres")
		else:
			sceneToLoad = load("res://Media/presets/defualtEffectnput.tres")
		
		
		entryClass.scene.inputMarker.add_stylebox_override("panel",sceneToLoad)
	
	return isAlertless


func checkForValidOption(currentEntry):
	if currentEntry.optionInputs.size() > 0:  currentEntry.isValid = true
	else:                             currentEntry.isValid = false



func checkForValidDataType(currentEntry):
	if currentEntry.input != "": 
		match currentEntry.dataType:
			"STRING"  : checkForString(currentEntry)
			"BOOLEAN" : checkForBoolean(currentEntry)
			"INTEGER" : checkForInteger(currentEntry)





func checkForBoolean(currentEntry): currentEntry.isValid  = true
func checkForString(currentEntry):  currentEntry.isValid  = true

func checkForInteger(currentEntry):
	for i in 9999:
		if currentEntry.input ==str(i):
			currentEntry.isValid  = true



class validityOfEntry:
	var input
	var scene
	var dataType
	
	var isValid = false
	var style
	var optionInputs
	
	func initialice(currentEntry):
		scene           = currentEntry["scene"]
		
		dataType        = currentEntry["validType"]
		style           = currentEntry["style"]
		optionInputs    = currentEntry["validInputs"]
		
		if currentEntry["scene"].inputRTL is OptionButton: currentEntry["scene"].inputRTL.get_item_text(currentEntry["scene"].inputRTL.selected)
		else:input           = currentEntry["scene"].inputRTL.bbcode_text
