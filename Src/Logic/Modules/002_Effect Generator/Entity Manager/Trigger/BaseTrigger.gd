extends Object
class_name _02_TriggerBaseHub


func getTriggerableByBase(kitSet:KitSetEntity):
	var strategy = kitSet.initialSelect["TRIGGER_BASE"].value
	var mType    = kitSet.initialSelect["SPACE"].mTypeEnum
	
	match strategy:
		"ACTOR":           return getTilemapNodes( mType,     [ENUM.TYPES_ON_MAP.ACTOR]    )       
		"INTERACT":        return getTilemapNodes( mType,     [ENUM.TYPES_ON_MAP.INTERACT] )
		"TILE":            return getTilemapNodes( mType,     [ENUM.TYPES_ON_MAP.TILE]     )
		
		"TILE_INTERACT":   return getTilemapNodes( mType,     [ENUM.TYPES_ON_MAP.TILE,     ENUM.TYPES_ON_MAP.INTERACT] )
		"INTERACT_ACTOR":  return getTilemapNodes(mType,      [ENUM.TYPES_ON_MAP.INTERACT, ENUM.TYPES_ON_MAP.TILE]     )
		"ACTOR_TILE":      return getTilemapNodes(mType,      [ENUM.TYPES_ON_MAP.TILE,     ENUM.TYPES_ON_MAP.ACTOR]    )

		"ALL":             return getTilemapNodes(mType,      [ENUM.TYPES_ON_MAP.TILE,     ENUM.TYPES_ON_MAP.INTERACT,   ENUM.TYPES_ON_MAP.ACTOR ]  )



func getTilemapNodes(listOfTilemaps):
	listOfTriggerableBase = []
	
	for i in listOfTilemaps.size():
		var currentNode        = getNodeBy(mType,listOfTilemaps[i])
		var currentTiggerables = collectByTriggerBase(arrToCollect)

		listOfTriggerableBase.append(currentTiggerables)

	return listOfTriggerableBase


	
func getNodeBy(mTypeEnum,triggerBase):
	if   mTypeEnum == ENUM.M_TYPES.MEAT:
		if   triggerBase == ENUM.TYPES_ON_MAP.TILE:       return SokraTiles.getMeatFloor()
		elif triggerBase == ENUM.TYPES_ON_MAP.INTERACT:   return SokraTiles.getMeatInteract()
	
	elif mTypeEnum == ENUM.M_TYPES.MATRIX:
		if   triggerBase == ENUM.TYPES_ON_MAP.TILE:       return SokraTiles.getMatrixFloor()
		elif triggerBase == ENUM.TYPES_ON_MAP.INTERACT:   return SokraTiles.getMatrixInteract()
		
	elif mTypeEnum == ENUM.M_TYPES.MAGIC:
		if   triggerBase == ENUM.TYPES_ON_MAP.TILE:       return SokraTiles.getMagicFloor()
		elif triggerBase == ENUM.TYPES_ON_MAP.INTERACT:   return SokraTiles.getMagicInteract()
	
	if triggerBase == ENUM.TYPES_ON_MAP.ACTOR:
		return SokraTiles.getActor()




func collectByTriggerBase(arr:Array):
	var selectedPositions = API_011_Player.getSelectedTiles()
	var returnArray = []
	for i in arr.size():
		var currentTilemapNode = arr[i]
		
		for j in selectedPositions.size():
			var currentSelect = selectedPositions[j]
			var currentEnt    = currentTilemapNode.getEntByPos_quack(currentSelect)
			if currentEnt != null: 
				returnArray.append(currentEnt)
	
	return returnArray
