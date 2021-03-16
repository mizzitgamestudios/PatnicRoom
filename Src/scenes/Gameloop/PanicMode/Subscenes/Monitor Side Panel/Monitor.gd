extends Node2D



func _enter_tree() -> void:
	get_node("AnimationPlayer").play("RightToLeft")
	get_node("credits dynamic").bbcode_text = str(API_011_Player.currentChar.getCompValue("C_9_CREDITS_ACCOUNT"))

func exitAnimation():
	get_node("AnimationPlayer").play("LeftToRight")
	yield(get_node("AnimationPlayer"),"animation_finished")
	Signals.emit_signal("animationFinished",self)
	








func _init() -> void:
	Signals.connect("selfDestruct",self,"selfdestruct")

	
func selfdestruct(arrToAppend):
	arrToAppend.append(self)
