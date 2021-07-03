extends Panel
class_name UniversalCheckbox

var innerBox
var formListenerNode
var toString
var grouping
func _init():
	self.connect("mouse_entered",self,"_on_Panel_mouse_enter")
	self.connect("mouse_exited",self,"_on_Panel_mouse_exit")



func _ready():
	innerBox = get_node("marker")


func connectToFormManager(formListenerNodePara,groupingPara):
	formListenerNode = formListenerNodePara
	grouping=groupingPara

var mouseEnter
func _on_Panel_mouse_enter():
	mouseEnter=true
func _on_Panel_mouse_exit():
	mouseEnter=false


func _gui_input(event):
		if event.is_pressed() and event.is_action("Interface_Mouse_Left") and Util.Nodes.isMouseOnNode(get_node(".")) :
			formListenerNode.manageCheckboxes(self)
