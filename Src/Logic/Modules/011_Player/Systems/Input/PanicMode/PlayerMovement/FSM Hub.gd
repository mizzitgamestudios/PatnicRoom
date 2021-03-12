extends Object
class_name _011_FSM_Hub_PlayerMovement


#----- INITIALICE ------------------------------------------------------------##

var parent

func _init(rootNodePara:Node) -> void:
	parent = rootNodePara



#----- INPUT HANDLER ---------------------------------------------------------##

var kitsetCache
func takeActionByEnum(event,previousState:int) -> int:
	if event is InputEventKey:
	
		if previousState == ENUM.PANIC_PLAYER_STATE.NEEDING_DIRECTION:
			var directionEnum = getActionWalking(event)
			
			if directionEnum is int: 
				API_005_KitSet.setDirectionOfKitset(directionEnum,kitsetCache)
				return ENUM.PANIC_PLAYER_STATE.SELECTING_DIRECTION





		if isActionWalking(event):
			SokraTiles.getPlayer().movePlayer( isActionWalking(event) )
			SokraTiles.getSelection().clearLayer()
			return ENUM.PANIC_PLAYER_STATE.STANDING



		if event.is_action_pressed("Panic_Kit_Selection"):
			kitsetCache = kitSelect(event)
			API_005_KitSet.getInitialKitsetSelect(kitsetCache)
			
			API_014_TilemapSelector.drawMarkerByKitset(kitsetCache)
			API_005_KitSet.getKitSelect(kitsetCache)
			
			return checkForDirectionNeeded(kitsetCache)







		if  event.is_action_pressed("enter"):
			API_005_KitSet.runKitSet(kitsetCache)
			return ENUM.PANIC_PLAYER_STATE.STANDING



	return ENUM.PANIC_PLAYER_STATE.STANDING



#----- HELPER ----------------------------------------------------------------##

func kitSelect(event):
	parent.previousStateSelector = ENUM.PANIC_PLAYER_STATE.SELECTING
	return API_011_Player.currentChar.getKitOfKitset(int(event.as_text())-1)


func isActionWalking(event):
	for i in ENUM.WALK_ACTIONS_BY_DIRECTION.size():
		if event.is_action_pressed(ENUM.WALK_ACTIONS_BY_DIRECTION[i]):  return i
	return false

func getActionWalking(event):
	if event.is_action_pressed(ENUM.WALK_ACTIONS_BY_DIRECTION[1]): return 1
	if event.is_action_pressed(ENUM.WALK_ACTIONS_BY_DIRECTION[2]): return 2
	if event.is_action_pressed(ENUM.WALK_ACTIONS_BY_DIRECTION[3]): return 3
	if event.is_action_pressed(ENUM.WALK_ACTIONS_BY_DIRECTION[4]): return 4


func checkForDirectionNeeded(kitset):
	if kitset != null:
		var medium = kitset.initialSelect["SPACE"].medium
		if medium == "LINEA" or medium =="LINEA_AREA": return ENUM.PANIC_PLAYER_STATE.NEEDING_DIRECTION
		else:                                          return ENUM.PANIC_PLAYER_STATE.SELECTING






