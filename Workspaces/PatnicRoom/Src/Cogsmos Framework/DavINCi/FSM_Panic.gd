extends Node
class_name _DavINCi_FSM_Panic




var FSM_InfoPanel    : _DavINCi_FSM_InfoPanel
var FSM_Movement     : _DavINCi_FSM_Movement
var FSM_Interface    : _DavINCi_FSM_Interface
var FSM_Action       : _DavINCi_FSM_Action


func _init():
	DavINCi.playerState    = ENUM.PANIC_PLAYER_STATE.STANDING
	DavINCi.interfaceState = ENUM.INPUT_MODE.VOID
	
	
	FSM_InfoPanel          = _DavINCi_FSM_InfoPanel.new()
	FSM_Movement           = _DavINCi_FSM_Movement.new()
	FSM_Interface          = _DavINCi_FSM_Interface.new()
	FSM_Action             = _DavINCi_FSM_Action.new()
	
	Signals.emit_signal("Start_Panic")
	Signals.connect("Actor_Turn_Finished",self,"manageRound")





func manageInput(event: InputEvent) -> void:
	if API_006_Player.getInputMode() and !event.is_echo() and event.is_action_type() and event.is_pressed():
		
		var inputEnum       = DavINCi.getInputToEnum(event)
		var inputType       = _Davinci_getter.getInputTypeByEnum(inputEnum)
		DavINCi.cachedInput = event
		
		
		if isInputInterface(inputType): 
			FSM_Interface.takeActionByEnum(inputEnum)
		
		
		match inputType:
			ENUM.INPUT_MODE.MOVEMENT  : FSM_Movement.takeActionByEnum(inputEnum)
			ENUM.INPUT_MODE.ACTION    : FSM_Action.takeActionByEnum(inputEnum)
			ENUM.INPUT_MODE.INFO      : FSM_InfoPanel.takeActionByEnum(inputEnum)
		
		if DavINCi.playerState == ENUM.PANIC_PLAYER_STATE.FINISHED: Gameloop.beginActorTurn()



func isInputInterface(inputType): return ENUM.INPUT_MODE.INTERFACE == inputType

 
func manageRound():
	Signals.emit_signal("Effect_Turn_Finished")
	API_006_Player.inputMode = true

