extends Object
class_name _02_TriggerBaseHub


func getTriggerableByBase(kitSet:KitSetEntity,entitiesInSelect:Array):
	var validatedTilesOnLayer = []
	var strategy = kitSet.initialSelect["TRIGGER_BASE"]
	
	match strategy.value:
		"ACTOR":
			return parser([SokraTiles.getActor()])
		"INTERACT":
			return parser([SokraTiles.getMeatInteract()])
		"TILE":
			return parser([SokraTiles.getMeatFloor()])
		
		"ALL":
			return parser([SokraTiles.getActor(),SokraTiles.getMeatFloor(),SokraTiles.getMeatInteract()])
	
		"TILE_INTERACT":
			return parser([SokraTiles.getMeatInteract(),SokraTiles.getMeatFloor()])
		"INTERACT_ACTOR":
			return parser([SokraTiles.getActor(),SokraTiles.getMeatInteract()])
		"TILE_ACTOR":
			return parser([SokraTiles.getActor(),SokraTiles.getMeatFloor()])



func parser(tilemapNodes:Array):
	var hittableEnts = []
	var selectedTiles = API_011_Player.getSelectedTiles()
	
	for layer in tilemapNodes.size():
		var currentLayer = tilemapNodes[layer]
		
		for i in selectedTiles.size():
			var currentSelect = selectedTiles[i]
				
			var currentCheck = currentLayer.getEntByPos_quack(currentSelect)
			if is_instance_valid(currentCheck):
				hittableEnts.append(currentCheck)
	
	
	return hittableEnts


