extends Node

var nodeOfPlayerLayer
var nodeOfCamOfPlayer 



func _enter_tree() -> void:
	DavINCi.initialicePanicScene(self)


func _input(event: InputEvent) -> void:   
	DavINCi.manageInput(event)

func manageRound():
	Signals.emit_signal("Effect_Turn_Finished")
	API_006_Player.inputMode = true



func recievePlayer(node)    : nodeOfPlayerLayer = node
func recievePlayerCam(node) : nodeOfCamOfPlayer = node

