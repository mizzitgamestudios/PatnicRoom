extends SokraTiles_Chunk
class_name SokraTiles_Chunk_Meat_Interactables

################################################################################
##  --- Init ---                                                              ##
################################################################################

var tilemap = tilemapReference
func _ready() -> void:
	name = "Meat interactables"
	var parsedTilemap = SokraTiles.layerManager.getLayer(ENUM.SOKRATILES_LAYER.MEAT_INTERACTABLE)
	.fillDictsForXRef(parsedTilemap)
	.drawWholeLayer()
