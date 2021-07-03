extends Node2D


var field: FormFieldAttributes


var sceneToLoad
var entriesMeta = []

var panel 
var entriesVBox
var closeButton

var arrOfEntrieNodes

func initialice(fieldPara:FormFieldAttributes) -> void:
	field       = fieldPara
	arrOfEntrieNodes = getInputReference()
	panel       = get_node("Panel")
	entriesVBox = get_node("Panel/form/entries")
	closeButton = get_node("Panel/form/close")
	
	
	sceneToLoad = load("res://Src/Frontend/content creation/Input/InputModules universal/dictionary/entry.tscn")
	
	setTitle()
	setEntries()
	setFormat()



func setTitle():
	get_node("title").bbcode_text = "[center]"+field.name



func setEntries():
	var counter = 1
	for entry in field.validInputs:
		
		var currentScene = sceneToLoad.instance()
		currentScene.initialice(entry,counter)
		
		entriesVBox.add_child(currentScene)
		entriesMeta.append( buildMetaDict(entry,currentScene) )
		
		counter += 1


func buildMetaDict(entry,currentScene):
	var entrySplit = entry.split(":")
	return { "type"    : entrySplit[1],
			 "name"    : entrySplit[0],
			 "scene"   : currentScene,
			 "content" : currentScene.get_node("entry1/inputField/inputRTL").bbcode_text }



func setFormat():
	var entriesSum   = entriesMeta.size()
	var minimumY     = 30 * entriesSum
	
	# Button
	var buttonY      = minimumY + 30
	var newPosButton = Vector2(0,buttonY)
	
	# Panel
	var posPanel     = panel.get_minimum_size()
	var panelY       = minimumY + 80
	var newSizePanel = Vector2(posPanel.x, posPanel.y+panelY)
	
	
	get_node("Panel").rect_min_size = newSizePanel
	closeButton.set_position(newPosButton)


func getInputReference():
	var arrToReturn = []
	for entry in entriesMeta:
		arrToReturn.append(arrToReturn["scene"])
	return arrToReturn















