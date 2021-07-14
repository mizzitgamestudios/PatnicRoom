extends SokraTiles_Chunk_Basic
class_name SokraTiles_Chunk_Interactables


func initialice(layerEnum,layerNode) -> void:
	entsOnMap = SokraTiles.getParsedLayer(layerEnum)
	SokraTiles.addChunkToKnownLayers(layerEnum,layerNode)
	
	_drawWholeLayer()

	
	

