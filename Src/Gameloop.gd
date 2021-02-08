extends Node



func manageRound(actionPhase):
	match actionPhase:
		
		ENUM.ACTION_PHASE.PLAYER_DONE:
			Signals.emit_signal("updateEntropy")
			API_011_Player.inputMode = false
			API_012_Behavior.loopThroughActor()
		
		ENUM.ACTION_PHASE.NPC_DONE:
			Signals.emit_signal("Effect_Turn")
			API_011_Player.inputMode = true



func initPanic():
	API_012_Behavior.loopThroughActor()


func startTitleMode():
	get_tree().change_scene("res://Src/scenes/Unique/Titlescreen/Title.tscn")
func startRestMode():
	get_tree().change_scene("res://Src/scenes/Gameloop/RestMode/Init.tscn")
func startPanicMode():
	get_tree().change_scene("res://Src/scenes/Gameloop/PanicMode/PanicMode.tscn")


func _on_PlayerTurnFinished():
	print("player move finished")
	Signals.emit_signal("Actor_Turn_Started")


func _on_ActorMoveFinished():
	print("Actor move finished")
	Signals.emit_signal("Player_Turn_Started")






