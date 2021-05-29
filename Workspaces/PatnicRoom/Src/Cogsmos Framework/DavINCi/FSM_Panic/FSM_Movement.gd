extends Object
class_name _DavINCi_FSM_Movement


var kitsetCache
func takeActionByEnum(inputEnum):
	var enumType = _Davinci_getter.getInputTypeByEnum(inputEnum)
	
	if isPlayerStateNeedingDirection(): 
		setKitSetDirection(inputEnum)
		
	elif inputIsMovement(inputEnum):      
			movePlayer(inputEnum)
	



	



# ----- VALIDATORS ----------------------------------------------------------- ##


func inputIsMovement(inputEnum):      return ENUM.INPUTS.MOVEMENT.values().has(inputEnum)

func inputIsKitSetEnter(inputEnum):    return ENUM.INPUTS.INTERFACE.ENTER == inputEnum
func isPlayerStateNeedingDirection(): return DavINCi.playerState                           == ENUM.PANIC_PLAYER_STATE.NEEDING_DIRECTION





# ----- VALIDATORS ----------------------------------------------------------- ##


func movePlayer(inputEnum):
	SokraTiles.getPlayer().movePlayer( inputEnum )
	SokraTiles.getSelection().clearLayer()
	DavINCi.playerState = ENUM.PANIC_PLAYER_STATE.FINISHED








	
func setKitSetDirection(inputEnum):
		API_004_KitSet.setDirectionOfKitset(inputEnum,DavINCi.kitSetOfSelection)
		DavINCi.playerState = ENUM.PANIC_PLAYER_STATE.SELECTING




func getActionWalking(event):
	if event.is_action_pressed(ENUM.WALK_ACTIONS_BY_DIRECTION[1]): return 1
	if event.is_action_pressed(ENUM.WALK_ACTIONS_BY_DIRECTION[2]): return 2
	if event.is_action_pressed(ENUM.WALK_ACTIONS_BY_DIRECTION[3]): return 3
	if event.is_action_pressed(ENUM.WALK_ACTIONS_BY_DIRECTION[4]): return 4



func isActionWalking(event):   return DavINCi.isInputCategory(ENUM.INPUTS.MOVEMENT, event)

