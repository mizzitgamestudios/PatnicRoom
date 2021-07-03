extends Node
class_name RestmodeUserinput

var background


var colorBBCode

var scenePath
var lastWrittenOut = "Retreat"
func mouseInputCompute(event,node):
	var mouse      = node.get_global_mouse_position()
	var inputMode  = "mouse"
	

	if isSelfHover(node) or isStationHover(node) or isPanicHover(node):
		matchNode(event,node,inputMode)
		markSelectedInput(node,colorBBCode)
		
	if Input.is_action_pressed("Input_Mouse_Left"):
		node.get_tree().change_scene(scenePath)

func keyInputCompute(event,node):
	lastWrittenOut = node.writtenOut
	var inputMode  = "key"
	
	if isSelfKeyInput(event) or isStationKeyInput(event):
		matchNode(event,node,inputMode)
		node.get_tree().change_scene(scenePath)



var nodeReference
func matchNode(event,node,inputMode):
	scenePath             = "res://Src/scenes/Gameloop/RestMode/Stations/Station.tscn"
	colorBBCode           = "yellow"
	
	if inputMode         == "mouse":   
		nodeReference     = node.writtenOut
	if inputMode         == "key":
		nodeReference     = str(event.scancode)
	
	
	
	if  nodeReference    == "Inventory" or nodeReference == str(KEY_1):
				scenePath = "res://Src/scenes/Gameloop/RestMode/Self/Inventory/Inventar.tscn"
	
	if  nodeReference    == "Char"      or nodeReference == str(KEY_2):
				scenePath = "res://Src/scenes/Gameloop/RestMode/Self/Charsheet/Charsheet.tscn"
	
	if  nodeReference    == "Rootnet"   or nodeReference == str(KEY_3):
				scenePath = "res://Src/scenes/Gameloop/RestMode/Self/Rootnet/Rootnet.tscn"
	
	
	if  nodeReference    == "Workshop"  or nodeReference == str(KEY_4):
		 RestMode.station = "Workshop"
	
	if  nodeReference    == "Retreat"   or nodeReference == str(KEY_5):
		 RestMode.station = "Retreat"
	
	if  nodeReference    == "Terminal"  or nodeReference == str(KEY_6):
		 RestMode.station = "Terminal"
	
	
	if nodeReference     == "[center]P@NIC!![/center]":
		scenePath         = "res://Src/scenes/Gameloop/PanicMode/Panicmode.tscn"
		colorBBCode       = "red"





func isKey(event):
	return event is InputEventKey            and event.is_pressed()


func isSelfHover(node):
	return node.writtenOut == "Inventory"     or node.writtenOut == "Char"      or node.writtenOut == "Rootnet"
func isStationHover(node):
	return node.writtenOut == "Workshop"      or node.writtenOut == "Terminal"  or node.writtenOut == "Retreat"
	
func isPanicHover(node):
	return node.writtenOut == "[center]P@NIC!![/center]"



func isSelfKeyInput(event):
	if isKey(event):
		return Input.is_key_pressed(KEY_1) or Input.is_key_pressed(KEY_2) or Input.is_key_pressed(KEY_3)
	return false
	
func isStationKeyInput(event):
	if isKey(event):
		return Input.is_key_pressed(KEY_4) or Input.is_key_pressed(KEY_5) or Input.is_key_pressed(KEY_6)
	return false






func markSelectedInput(node,colorBBCode):
	if Util.Nodes.isMouseOnNode(node):
		node.bbcode_text = "[color="+colorBBCode+"]"+node.writtenOut+"[/color]"
	else: 
		node.bbcode_text = "[color=white]"+node.writtenOut+"[/color]"



