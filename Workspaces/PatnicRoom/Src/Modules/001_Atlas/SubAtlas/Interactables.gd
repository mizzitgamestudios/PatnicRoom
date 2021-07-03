extends DemokrECTS_Atlas
class_name _17_Interactables


# ----- INITIALICE ----------------------------------------------------------- ##


func _init() -> void:
	classOfEntries = InteractEntity
	indexComponent = C_2_ANY_TEXTURE_ID.name_quack()
	

func _ready():
	var tilesets = API_001_Atlas.TileSetAtlas().values()
	
	for currentTileset in tilesets:
		for currentTile in currentTileset:
			
			if currentTile.hasFlag(int(1)):  API_001_Atlas._interactables.addEntity(currentTile)



# ----- SETTER --------------------------------------------------------------- ##
	
	
	
	









