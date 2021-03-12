extends Node2D



func _enter_tree() -> void:
	get_node("AnimationPlayer").play("RightToLeft")

func exitAnimation():
	get_node("AnimationPlayer").play("LeftToRight")
	yield(get_node("AnimationPlayer"),"animation_finished")
	Signals.emit_signal("animationFinished",self)
	








func _init() -> void:
	Signals.connect("selfDestruct",self,"selfdestruct")

	
func selfdestruct(arrToAppend):
	arrToAppend.append(self)