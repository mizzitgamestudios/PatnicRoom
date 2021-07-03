extends RichTextLabel
class_name TextInputField

#directory-Parameter
#Array:nodename,Textinhalt,upperLeft
var description
func _init(nodeDictEntry):
	set_name(nodeDictEntry[0])
	setMeassurement(nodeDictEntry)
	setTextformat(nodeDictEntry)

	self.connect("mouse_entered",self,"_on_RichTextLabel_mouse_enter")
	self.connect("mouse_exited",self,"_on_RichTextLabel_mouse_exit")
	description=nodeDictEntry[0]



func setMeassurement(nodeDictEntry):
	set_position(Vector2(nodeDictEntry[2],nodeDictEntry[3]))
	_set_size(Vector2(350,50))
	visible=true
	
func setTextformat(nodeDictEntry):
	bbcode_enabled=true
	set("custom_fonts/normal_font",load("res://Media/FixedDays Font/Text_Header.tres"))
	bbcode_text="[center]"+nodeDictEntry[1]





func _on_RichTextLabel_mouse_enter():
	set_modulate(Color.yellow)
func _on_RichTextLabel_mouse_exit():
	set_modulate(Color.white)

var Mainmenue=true
func _gui_input(event):
	if event is InputEventMouseButton and event.is_action("Interface_Mouse_Left") and Mainmenue:
		get_parent().manageSubscreens(self.name)
		Mainmenue=false


