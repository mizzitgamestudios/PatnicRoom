extends Node

var nodeOfPlayerLayer
var nodeOfCamOfPlayer 

var playerMovement_FSM: _011_FSM_Hub_PlayerMovement
var userInterface_FSM: _011_FSM_Hub_InterfacePanel


var previousStateInterface = 0
var previousStatePlayer = 10
var previousStateSelector = 999

func _init() -> void:
	Signals.connect("Actor_Turn_Finished",self,"manageRound")

func _ready() -> void:
	userInterface_FSM = _011_FSM_Hub_InterfacePanel.new(self)
	playerMovement_FSM = _011_FSM_Hub_PlayerMovement.new(self)
	Signals.emit_signal("Start_Panic")
	


func _input(event: InputEvent) -> void:
	
	if API_011_Player.getInputMode() and not event.is_echo() and event.is_pressed():
		print(API_011_Player.getInputMode())
		if event.is_action_type():
			
			
			if ENUM.PANIC_INTERFACE_STATE.values().has(previousStateInterface):
				previousStateInterface = userInterface_FSM.takeActionByEnum(event,previousStateInterface)
			


			if ENUM.PANIC_PLAYER_STATE.values().has(previousStatePlayer):
				previousStatePlayer = playerMovement_FSM.takeActionByEnum(event,previousStatePlayer)
			


			if ENUM.PANIC_PLAYER_STATE.STANDING == previousStatePlayer:
				Gameloop.beginActorTurn()
			# ---- Ende ---- #
		
 

func manageRound():
	Signals.emit_signal("Effect_Turn_Finished")
	API_011_Player.inputMode = true


func recievePlayer(node):
	nodeOfPlayerLayer=node
func recievePlayerCam(node):
	nodeOfCamOfPlayer=node



func getMovementStateMachine():
	return playerMovement_FSM
func getMovementScript():
	return playerMovement_FSM.playerScript

func getInterfaceStateScript():
	return userInterface_FSM
func getInterfaceScript():
	return userInterface_FSM.sidePanelScript


