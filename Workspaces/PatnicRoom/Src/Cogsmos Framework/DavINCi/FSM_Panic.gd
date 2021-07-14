extends Node
class_name _DavINCi_FSM_Panic


# ----- INITIALICE ----------------------------------------------------------- ##


var FSM_InfoPanel    : _DavINCi_FSM_InfoPanel
var FSM_Movement     : _DavINCi_FSM_Movement
var FSM_Interface    : _DavINCi_FSM_Interface
var FSM_Action       : _DavINCi_FSM_Action


func _init():
	DavINCi.playerState    = ENUM.INPUT_PANIC.PLAYER_STATE.STANDING
	DavINCi.interfaceState = ENUM.INPUT_PANIC.INPUT_MODE.VOID
	
	
	FSM_InfoPanel          = _DavINCi_FSM_InfoPanel.new()
	FSM_Movement           = _DavINCi_FSM_Movement.new()
	FSM_Interface          = _DavINCi_FSM_Interface.new()
	FSM_Action             = _DavINCi_FSM_Action.new()
	
	Signals.emit_signal("Start_Panic")
	Signals.connect("Actor_Turn_Finished",self,"manageRound")


 
# ----- HUB ------------------------------------------------------------------ ##


func manageInput(event: InputEvent) -> void:
	if API_006_Player.getInputMode() and not event.is_echo() and event.is_action_type() and event.is_pressed():
		
		var inputEnum       = DavINCi.getInputToEnum(event)
		var inputType       = _Davinci_getter.getInputTypeByEnum(inputEnum)
		DavINCi.cachedInput = event
		
		
		FSM_Action.takeActionByEnum(inputEnum, inputType)
		
		match inputType:
			ENUM.INPUT_PANIC.INPUT_MODE.MOVEMENT  : FSM_Movement.takeActionByEnum(inputEnum, inputType)
			ENUM.INPUT_PANIC.INPUT_MODE.ACTION    : FSM_Action.takeActionByEnum(inputEnum, inputType)
			ENUM.INPUT_PANIC.INPUT_MODE.INFO      : FSM_InfoPanel.takeActionByEnum(inputEnum, inputType)
			ENUM.INPUT_PANIC.INPUT_MODE.INTERFACE : FSM_Interface.takeActionByEnum(inputEnum, inputType)
		

		if isPlayerFinished(): Gameloop.beginActorTurn()



# ----- VALIDATOR ------------------------------------------------------------ ##


func isInputInterface(inputType):   return ENUM.INPUT_PANIC.INPUT_MODE.INTERFACE        == inputType
func isPlayerFinished():            return ENUM.INPUT_PANIC.PLAYER_STATE.FINISHED == DavINCi.playerState 
 

func manageRound():
	Signals.emit_signal("Effect_Turn_Finished")
	API_006_Player.inputMode = true

	
