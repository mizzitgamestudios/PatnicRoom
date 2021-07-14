extends RichTextLabel
class_name FromatedRichtextLabel

var injectedLogic



var contentCache   = ""

var color          = "white"
var highlightColor = "yellow"
var alertColor     = "red"


func _init():
	bbcode_enabled = true

func initialice(injectedLogicInstancePara,contentPara:String,colorPara="white"):
	changeColor(colorPara)
	changeContent(contentPara,true)
	injectedLogic = injectedLogicInstancePara



func _input(event:InputEvent):
	if event is InputEventMouse:

		if  Util.Nodes.isMouseOnNode(self): highlightText()
		if !Util.Nodes.isMouseOnNode(self): resetText()
	

	if event.is_action_pressed("Input_Mouse_Left") and Util.Nodes.isMouseOnNode(self):
		injectedLogic.run()




func alertText():     changeColor(alertColor,true)
func highlightText(): changeColor(highlightColor,true)
func resetText():     changeColor(color,true)



func changeColor(colorPara:String,updateBool=false):	
	if updateBool: updateText(colorPara)

func changeContent(contentPara:String,updateBool=false):	
	contentCache = contentPara 
	if updateBool: updateText()



func updateText(colorPara=color,contentPara=contentCache):
	bbcode_text = "[color="+str(colorPara)+"]"+str(contentPara)+"[/color]"






