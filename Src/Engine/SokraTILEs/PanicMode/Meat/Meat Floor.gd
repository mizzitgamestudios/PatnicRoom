extends SokraTiles_Chunk
class_name SokraTiles_Chunk_Meat_Floor

################################################################################
##  --- Init ---                                                              ##
################################################################################

var tilemap = tilemapReference
func _ready() -> void:
	name = "Meat ground"
	var parsedTilemap = SokraTiles.layerManager.getLayer(ENUM.SOKRATILES_LAYER.MEAT_GROUND)
	.fillDictsForXRef(parsedTilemap)
	.drawWholeLayer()


