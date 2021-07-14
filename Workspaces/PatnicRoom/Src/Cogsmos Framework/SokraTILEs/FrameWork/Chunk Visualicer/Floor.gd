extends SokraTiles_Chunk_Basic
class_name SokraTiles_Chunk_Floor


func initialice(layerEnum,layerNode) -> void:
	self.entsOnMap = SokraTiles.getParsedLayer(layerEnum)
	SokraTiles.addChunkToKnownLayers(layerEnum,layerNode)
	
	_drawWholeLayer()






