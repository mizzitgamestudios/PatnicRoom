extends Node
class_name _DavINCi_FSM_Panic


<<<<<<< HEAD
# ----- INITIALICE ----------------------------------------------------------- ##
=======
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684


var FSM_InfoPanel    : _DavINCi_FSM_InfoPanel
var FSM_Movement     : _DavINCi_FSM_Movement
var FSM_Interface    : _DavINCi_FSM_Interface
var FSM_Action       : _DavINCi_FSM_Action


func _init():
<<<<<<< HEAD
	DavINCi.playerState    = ENUM.INPUT_PANIC.PLAYER_STATE.STANDING
	DavINCi.interfaceState = ENUM.INPUT_PANIC.INPUT_MODE.VOID
=======
	DavINCi.playerState    = ENUM.PANIC_PLAYER_STATE.STANDING
	DavINCi.interfaceState = ENUM.INPUT_MODE.VOID
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
	
	
	FSM_InfoPanel          = _DavINCi_FSM_InfoPanel.new()
	FSM_Movement           = _DavINCi_FSM_Movement.new()
	FSM_Interface          = _DavINCi_FSM_Interface.new()
	FSM_Action             = _DavINCi_FSM_Action.new()
	
	Signals.emit_signal("Start_Panic")
	Signals.connect("Actor_Turn_Finished",self,"manageRound")


<<<<<<< HEAD
 
# ----- HUB ------------------------------------------------------------------ ##


func manageInput(event: InputEvent) -> void:
	if API_006_Player.getInputMode() and not event.is_echo() and event.is_action_type() and event.is_pressed():
=======



func manageInput(event: InputEvent) -> void:
	if API_006_Player.getInputMode() and !event.is_echo() and event.is_action_type() and event.is_pressed():
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
		
		var inputEnum       = DavINCi.getInputToEnum(event)
		var inputType       = _Davinci_getter.getInputTypeByEnum(inputEnum)
		DavINCi.cachedInput = event
		
		
<<<<<<< HEAD
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
 

=======
		if isInputInterface(inputType): 
			FSM_Interface.takeActionByEnum(inputEnum)
		
		
		match inputType:
			ENUM.INPUT_MODE.MOVEMENT  : FSM_Movement.takeActionByEnum(inputEnum)
			ENUM.INPUT_MODE.ACTION    : FSM_Action.takeActionByEnum(inputEnum)
			ENUM.INPUT_MODE.INFO      : FSM_InfoPanel.takeActionByEnum(inputEnum)
		
		if DavINCi.playerState == ENUM.PANIC_PLAYER_STATE.FINISHED: Gameloop.beginActorTurn()



func isInputInterface(inputType): return ENUM.INPUT_MODE.INTERFACE == inputType

 
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
func manageRound():
	Signals.emit_signal("Effect_Turn_Finished")
	API_006_Player.inputMode = true

<<<<<<< HEAD
	
=======
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
