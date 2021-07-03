extends Node2D

var options

var raceNode: 		OptionButton
var kitsNode: 		OptionButton
var startButton: 	Control
var nameNode: 		RichTextLabel

func _ready() -> void:
	options = Util.JSONParser.fileToDictionary("res://config/Savestate/One/Runner/chargen presets.json")
	
	raceNode    = get_node("Panel2/Race/OptionButton")
	kitsNode    = get_node("Panel2/kits/OptionButton")
	startButton = get_node("start")
	nameNode    = get_node("Panel2/Name/input")
	 
	fillRace()
	fillKits()


func fillRace():
	var raceOption = options["race"]
	raceNode.add_item("")
	
	for i in raceOption.size():
		var currentRaceToString = raceOption.keys()[i]
		currentRaceToString = currentRaceToString.split(" ")[2]
		raceNode.add_item(currentRaceToString)


func fillKits():
	var kitOption  = options["kits"]
	kitsNode.add_icon_item(load(" "),"")
	
	for i in kitOption.size():
		var currentKit = kitOption[i]
		
		var currentKitToString    = currentKit["name"]
		var currentKitImgToString = currentKit["image"]
		
		kitsNode.add_icon_item(load(currentKitImgToString),currentKitToString)




func _input(event: InputEvent) -> void:
	var kitNr  = kitsNode.selected
	var raceNr = raceNode.selected
<<<<<<< HEAD
	var charName = nameNode.bbcode_text
=======
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
	
	if Util.Nodes.isMouseOnNode(nameNode) and event is InputEventKey:
		var charToAdd = event.as_text()
		nameNode.bbcode_text = nameNode.bbcode_text+str(charToAdd)
	
	
	if isSelectValid(kitNr):
		var currentKitToString = options["kits"][kitNr-1]["toString"]
		get_node("Panel2/kits/toString").bbcode_text = currentKitToString
	
	
	if isSelectValid(raceNr):
		var currentRaceToString = options["race"].values()[raceNr-1]
		get_node("Panel2/Race/toString").bbcode_text = currentRaceToString
	
	
<<<<<<< HEAD
	if isSelectValid(kitNr) and isSelectValid(raceNr) and charName != "":
=======
	if isSelectValid(kitNr) and isSelectValid(raceNr):
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
		startButton.visible = true
	
	
		if isGameStartable(event):
			setUpChargenDict(raceNr,kitNr)
			API_006_Player.generateNewChar()
			Gameloop.startPanicMode()



func setUpChargenDict(raceNr:int,kitNr:int):
	var dict = Util.JSONParser.fileToDictionary("res://config/Savestate/One//Runner/generated/generall and stats.json")
	
	var kitString  = options["kits"][kitNr-1]["name"]
	var raceString = options["race"].keys()[raceNr-1]
	
	dict ["Kits"]  = kitString
	dict ["race"]  = raceString
	dict["name"]   = nameNode.bbcode_text
	
	API_006_Player.chargenSelecttion = dict


func isSelectValid(selectNr:int):		return selectNr > 0
<<<<<<< HEAD
func isGameStartable(event:InputEvent):	return Util.Nodes.isMouseOnNode(startButton) and event.is_action_pressed("Interface_Mouse_Left")
=======
func isGameStartable(event:InputEvent):	return Util.Nodes.isMouseOnNode(startButton) and event.is_action_pressed("Input_Mouse_Left")
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
