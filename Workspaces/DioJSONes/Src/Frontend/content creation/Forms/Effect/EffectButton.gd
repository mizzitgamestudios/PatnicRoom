extends BaseButton

var isStatmod   = false
var text:         RichTextLabel
var statmodStyle
var conditionStyle

func _ready() -> void:
	text           = get_parent().get_node("RichTextLabel")
	statmodStyle   = load("res://Media/presets/EffectButton/Statmod.tres")
	conditionStyle = load("res://Media/presets/EffectButton/Condition.tres")
	
	toggleButton()



func _input(event: InputEvent) -> void:
	if isMouseOnNode(self) and event.is_action("leftClick") and event.is_pressed():   toggleButton()



func isMouseOnNode(node):
	var minVec = node.rect_global_position
	var cacheSizeOfRect = Vector2(node.get_end().x-node.get_begin().x,node.get_end().y-node.get_begin().y)
	var maxVec = Vector2(minVec.x+cacheSizeOfRect.x,minVec.y+cacheSizeOfRect.y)
		
	var mouse = node.get_global_mouse_position()

	return mouse.x > minVec.x and mouse.y > minVec.y and mouse.x < maxVec.x and mouse.y < maxVec.y




func toggleButton() -> void:
	isStatmod = !isStatmod
	
	if  isStatmod: setOnStatmod()
	if !isStatmod: setOnCondition()
	get_node("../../selectionMenue").fillContainer(isStatmod)



func setOnCondition():
	get_parent().effectMode = ENUM.EFFECT_TYPE.CONDITION
	text.bbcode_text        = "[color=black][center]Condition[/center][/color]"
	
	self.add_stylebox_override("normal",conditionStyle)


func setOnStatmod():
	get_parent().effectMode = ENUM.EFFECT_TYPE.STAT_MOD
	text.bbcode_text        = "[color=white][center]Modification[/center][/color]"
	
	self.add_stylebox_override("normal",statmodStyle)




