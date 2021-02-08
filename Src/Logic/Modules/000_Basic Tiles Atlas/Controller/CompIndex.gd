extends Node
class_name _00_00_CompIndex
const index = {

################################################################################
##  --- Basic Tiles ---                                                       ##
################################################################################

	"Comp_Tile_Name":Comp_Tile_Name,
	"Comp_Tile_Description":Comp_Tile_Description,
	"Comp_Tile_TextureID":Comp_Tile_TextureID,
	
	"Comp_Tile_StaticTilesetCellNr":Comp_Tile_StaticTilesetCellNr,
	"Comp_Tile_Layer":Comp_Tile_Layer,
	"Comp_Tile_IsWalkable":Comp_Tile_IsWalkable,
	
	"Comp_Tile_MagicNoise":Comp_Tile_MagicNoise,
	"Comp_Tile_MatrixNoise":Comp_Tile_MatrixNoise
}

static func getIndex():
	return index
