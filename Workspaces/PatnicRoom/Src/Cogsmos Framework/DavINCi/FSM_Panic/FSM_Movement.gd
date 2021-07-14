extends Object
class_name _DavINCi_FSM_Movement


# ----- INPUT HANDLER -------------------------------------------------------- ##


var kitsetCache
func takeActionByEnum(inputEnum, inputType):
	
	# input: W || A || S || D   &&   player: NEEDING_DIRECTION #
	if isPlayerStateNeedingDirection(): setKitSetDirection(inputEnum)

	# input: W || A || S || D   &&   player: STANDING # 	
	elif inputIsMovement(inputEnum):    movePlayer(inputEnum)
		


# ----- VALIDATORS ----------------------------------------------------------- ##


func inputIsMovement(inputEnum):       return ENUM.INPUT_PANIC.INPUTS.MOVEMENT.values().has(inputEnum)
func isPlayerStateNeedingDirection():  return ENUM.INPUT_PANIC.PLAYER_STATE.NEEDING_DIRECTION == DavINCi.playerState 



# ----- MOVEMENTS ------------------------------------------------------------ ##


func movePlayer(inputEnum):
	SokraTiles.getPlayer().movePlayer( inputEnum )
	SokraTiles.getSelection().clearLayer()
	DavINCi.playerState = ENUM.INPUT_PANIC.PLAYER_STATE.FINISHED


func setKitSetDirection(inputEnum):
		API_004_KitSet.setDirectionOfKitset(inputEnum,DavINCi.kitSetOfSelection)
		DavINCi.playerState = ENUM.INPUT_PANIC.PLAYER_STATE.SELECTING


