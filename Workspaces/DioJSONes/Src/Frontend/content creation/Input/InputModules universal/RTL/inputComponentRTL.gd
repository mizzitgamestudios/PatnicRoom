extends RichTextLabel
class_name InputRTL

onready var corespondingPanel:    Panel        = get_parent()

onready var defaultStyle:         StyleBoxFlat = load("res://Media/presets/IntegerInput.tres")  
onready var highlightStyle:       StyleBoxFlat = load("res://Media/presets/highlightedFormInput.tres")  

onready var inputMode:            bool         = false
onready var inputContent:         String       = ""
onready var isRegisteredInParser: bool         = false

var debug =false


func _input(event: InputEvent) -> void:
	if isTextFieldClicked(event):         
		inputMode = true
	
	if isTextInput(event):
		inputContent = getKeyToWrite(event.as_text())
		interpreteBBCode(inputContent) 
	
	
	# --- Styling --- #
	if isMouseOnNode(corespondingPanel):  
		corespondingPanel.add_stylebox_override("panel",highlightStyle)
	
	if !isMouseOnNode(corespondingPanel) and !debug: 
		inputMode = false
		corespondingPanel.add_stylebox_override("panel",defaultStyle)

		


func isTextInput(event):        return isMouseOnNode(corespondingPanel) and inputMode and event is InputEventKey and event.is_pressed()
func isTextFieldClicked(event): return isMouseOnNode(corespondingPanel) and event.is_action("leftClick")
func isDeleteInput(event):      return isMouseOnNode(corespondingPanel) and event.is_action("delete")
func isMouseOnNode(node):
	var minVec          = node.rect_global_position
	var cacheSizeOfRect = Vector2(node.get_end().x-node.get_begin().x,node.get_end().y-node.get_begin().y)
	var maxVec          = Vector2(minVec.x+cacheSizeOfRect.x,minVec.y+cacheSizeOfRect.y)
	var mouse           = node.get_global_mouse_position()
	return mouse.x > minVec.x and mouse.y > minVec.y and mouse.x < maxVec.x and mouse.y < maxVec.y


func getKeyToWrite(eventToString:String):
	var stringToReturn = eventToString
	var inputType =get_node("../../typeRTL").bbcode_text
	
	if eventToString.begins_with("Kp"):   stringToReturn = eventToString.split("Kp ")[1]
	elif eventToString == "Minus":        stringToReturn = "-"
	elif eventToString == "Plus":         stringToReturn = "+"
	elif eventToString == "Space":        stringToReturn = " "
	
	elif eventToString == "Shift":        stringToReturn = ""
	elif eventToString == "Control":      stringToReturn = ""
	elif eventToString == "Alt":          stringToReturn = ""
	
	elif eventToString == "BackSpace":    stringToReturn = "[BACKSPACE]"
	
	
	elif inputType == "(whole Number)": stringToReturn = getNumber(eventToString)
	
	
	return stringToReturn


func interpreteBBCode(keyToString):
	match keyToString:
		"[BACKSPACE]":
			var cuttedText = bbcode_text
			cuttedText.erase(cuttedText.length()-1,1)
			bbcode_text = cuttedText
		_:
			if   bbcode_text.length() == 0: bbcode_text += keyToString
			elif bbcode_text.length() != 0: bbcode_text += keyToString.to_lower()


func getNumber(eventToString:String):
	for i in 10:
		if str(i) == eventToString: return str(i)
	return ""

func setDebugMode():
	debug = !debug
	corespondingPanel.add_stylebox_override("panel",load("res://Media/presets/debugPanelStyle.tres"))

