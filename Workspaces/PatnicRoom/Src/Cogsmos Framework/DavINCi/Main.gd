extends Node


var FSM_Hub

var gameloopScene

var interfaceState   : int 
var playerState      : int 

var kitSetOfSelection


func initialicePanicScene(scene): 
	gameloopScene = scene
	FSM_Hub = _DavINCi_FSM_Panic.new()

<<<<<<< HEAD
=======

>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
func initialiceRestScene(scene):  
	gameloopScene = scene
	FSM_Hub = _DavINCi_FSM_Rest.new()

<<<<<<< HEAD



var cachedInput
var externalCachedInput
func manageInput(event:InputEvent): 
	cachedInput = event 
	FSM_Hub.manageInput(event)
=======
var cachedInput
func manageInput(event:InputEvent): FSM_Hub.manageInput(event)

>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684

func changeInfoPanel(event:InputEvent, previousState:int): 
	_Davinci_InfoPanel.changeInfoPanel( DavINCi.getInputAsEnum(event), previousState)



<<<<<<< HEAD
	

=======
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684

func getTypeToEnum(event:InputEvent)                  -> int:        return _Davinci_getter.getInputTypeOfEnum(event)

func getInputToEnum(event:InputEvent)                 -> int:        return _Davinci_getter.getInputAsEnum(event)
func getInputToString(event:InputEvent)               -> String:     return _Davinci_getter.getInputAsString(event)

func isInputEnum(searchedEnum:int, event:InputEvent)  -> bool:       return _Davinci_getter.getInputAsEnum(event) == searchedEnum
func isInputCategory(category:int, event:InputEvent)  -> bool:       return getTypeToEnum(event) == category









