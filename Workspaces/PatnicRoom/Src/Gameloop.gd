extends Node


func initPanic():
	API_014_Behavior.loopThroughActor()


func startTitleMode():
	get_tree().change_scene("res://Src/scenes/Unique/Titlescreen/Title.tscn")



func startRestMode():
	get_tree().change_scene("res://Src/scenes/Gameloop/RestMode/Init.tscn")
func startPanicMode():
	SokraTiles.parseTilemap("res://Media/TileMap/custome/Suburban.json")
	get_tree().change_scene("res://Src/scenes/Gameloop/PanicMode/PanicMode.tscn")





func _on_ActorMoveFinished():
	print("Actor move finished")
	Signals.emit_signal("Player_Turn_Started")



func beginActorTurn():
	API_002_Tilemap.updateDirtyTiles()

	SokraTiles.getSelection().clearLayer()
	Signals.emit_signal("updateEntropy")
	Signals.emit_signal("Effect_Turn_Started")
	Signals.emit_signal("Effect_Turn_Finished")
	API_014_Behavior.loopThroughActor()
	Signals.emit_signal("Actor_Turn_Finished")
	API_002_Tilemap.updateDirtyTiles()




