extends Node


func startTitleMode():
	get_tree().change_scene("res://Src/scenes/Unique/Titlescreen/Title.tscn")

func startRestMode():
	get_tree().change_scene("res://Src/scenes/Gameloop/RestMode/Init.tscn")

func startPanicMode():
	get_tree().change_scene("res://Src/scenes/Gameloop/PanicMode/PanicMode.tscn")
