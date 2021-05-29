extends DemokrECTS_Atlas
class_name _17_Interactables

# ----- INITIALICE ----------------------------------------------------------- ##

func _init() -> void:
	classOfEntries = InteractEntity
	indexComponent = C_2_ANY_TEXTURE_ID.name_quack()


func fillInteractableTilesInOwnAtlas():
	var tilesets = API_001_Atlas.TileSetAtlas().values()
	
	for i in tilesets.size():
		var currentTileset = tilesets[i].values()
		
		for j in currentTileset.size():
			var currentTile = currentTileset[j]
			
			if currentTile.hasFlag("F_1_STATIC_INTERACTABLE_TYPE"):
				API_001_Atlas._interactables.addEntity(currentTile)
	
	
	
	









