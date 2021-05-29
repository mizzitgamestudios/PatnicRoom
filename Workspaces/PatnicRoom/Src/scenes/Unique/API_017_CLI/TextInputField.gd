extends RichTextLabel

var currentCmd       = "" 
var currentParameter = []
var currentState     = CMD_STATE.EMPTY

var neededParameter  : int


enum CMD_STATE { EMPTY, CMD, PARA }
var cmds       = API_017_CLI.getSyntax().keys()
var cmdsSyntax = API_017_CLI.getSyntax()

var cmdInput
var cmdPara  = []





func _enter_tree() -> void:  
	bbcode_text = ""
	var root = get_node("../../..")
	cmdInput = root.get_node("selection/cmd/input")
	cmdPara =  [ root.get_node("selection/parameter1/input"),
				  root.get_node("selection/parameter2/input"),
				  root.get_node("selection/parameter3/input")]




func _input(event: InputEvent) -> void:
	if event.is_pressed() and not event.is_echo() and event is InputEventKey:
		
		print(event.as_text())
		if event.is_action("Interface_Cntl")          : enterInput()
		elif event.as_text() == "Space"     : bbcode_text += " "
		elif event.as_text() == "BackSpace" : bbcode_text = ""
		
		else: 
			bbcode_text += event.as_text().to_lower()	
		
		
		

func enterInput():
	if currentState == CMD_STATE.EMPTY:		insertCmdIntoSelect()




	API_017_CLI.processCmd(bbcode_text.to_lower())
	bbcode_text = ""


func insertCmdIntoSelect():
	if cmds.has(bbcode_text):
		cmdInput.bbcode_text = "[color=lime]"+bbcode_text
		currentCmd           = bbcode_text

	bbcode_text = ""
