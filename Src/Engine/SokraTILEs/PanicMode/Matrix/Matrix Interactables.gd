extends SokraTiles_Chunk
class_name SokraTiles_Chunk_Matrix_Interactables

################################################################################
##  --- Init ---                                                              ##
################################################################################


func _ready() -> void:
	var parsedTilemap = SokraTiles.layerManager.getLayer(ENUM.SOKRATILES_LAYER.MATRIX_INTERACTABLE)
	.fillDictsForXRef(parsedTilemap)
	.drawWholeLayer()
