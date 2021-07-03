extends Object
class_name _02_TriggerBaseHub


func getTriggerableByBase(kitSet:KitSetEntity,entitiesInSelect:Array):
	var toParseToReturn
	var strategy = kitSet.initialSelect["TRIGGER_BASE"]
	
	
	match strategy.value:
		"ALL"      		 : 	toParseToReturn =  getLayerByKeyword( [ "TILE" , "ACTOR" , "INTERACT" ] , kitSet) 
		
		"TILE_INTERACT"  : 	toParseToReturn =  getLayerByKeyword( [ "TILE"  , "INTERACT"          ] , kitSet) 
		"INTERACT_ACTOR" : 	toParseToReturn =  getLayerByKeyword( [ "ACTOR" , "INTERACT"          ] , kitSet) 
		"TILE_ACTOR"     : 	toParseToReturn =  getLayerByKeyword( [ "TILE"  , "ACTOR"             ] , kitSet) 
		
		"INTERACT"       :	toParseToReturn =  getLayerByKeyword( [ "INTERACT"                    ] , kitSet) 
		"ACTOR"          :	toParseToReturn =  getLayerByKeyword( [ "ACTOR"                       ] , kitSet) 
		"TILE"     		 :	toParseToReturn =  getLayerByKeyword( [ "TILE"                        ] , kitSet) 
	
	
	return parser(toParseToReturn)




func getLayerByKeyword(keywords:Array,kitset:KitSetEntity):
	var mTypePrefix         = kitset.mType+"_"
	var arrOfLayersToReturn = []
	
	for keyword in keywords:
		
		if keyword == "ACTOR"     : arrOfLayersToReturn.append( SokraTiles.getActor()           )
		match mTypePrefix+keyword :
			"MEAT_INTERACT"       : arrOfLayersToReturn.append( SokraTiles.getMeatInteract()    )
			"MEAT_TILE"           : arrOfLayersToReturn.append( SokraTiles.getMeatFloor()       )
			
			"MATRIX_INTERACT"     : arrOfLayersToReturn.append( SokraTiles.getMatrixInteract()  )
			"MATRIX_TILE"         : arrOfLayersToReturn.append( SokraTiles.getMatrixFloor()     )
			
			"MAGIC_INTERACT"      : arrOfLayersToReturn.append( SokraTiles.getMagicInteract()   )
			"MAGIC_TILE"          : arrOfLayersToReturn.append( SokraTiles.getMagicFloor()      )
	
	
	return arrOfLayersToReturn





func parser(tilemapNodes:Array):
	var hittableEnts = []
	var selectedTiles = API_006_Player.getSelectedTiles()
	
	for currentLayer in tilemapNodes:
		for currentSelect in selectedTiles:
				
			var currentCheck = currentLayer.getEntByPos_quack(currentSelect)
			if is_instance_valid(currentCheck): hittableEnts.append(currentCheck)
	
	return hittableEnts


