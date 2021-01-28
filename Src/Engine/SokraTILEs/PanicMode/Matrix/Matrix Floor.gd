extends SokraTiles_Chunk
class_name SokraTiles_Chunk_Matrix_Floor

################################################################################
##  --- Init ---                                                              ##
################################################################################

var tilemap = tilemapReference
func _ready() -> void:
	name = "Matrix ground"
	var parsedTilemap = SokraTiles.layerManager.getLayer(ENUM.SOKRATILES_LAYER.MATRIX_GROUND)
	.fillDictsForXRef(parsedTilemap)
	.drawWholeLayer()


