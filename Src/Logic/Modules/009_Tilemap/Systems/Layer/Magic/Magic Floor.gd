extends SokraTiles_Chunk
class_name SokraTiles_Chunk_Magic_Floor

################################################################################
##  --- Init ---                                                              ##
################################################################################

var tilemap = tilemapReference
func _ready() -> void:
	name = "Magic ground"
	var parsedTilemap = SokraTiles.layerManager.getLayer(ENUM.SOKRATILES_LAYER.MAGIC_GROUND)
	.fillDictsForXRef(parsedTilemap)
	.drawWholeLayer()


