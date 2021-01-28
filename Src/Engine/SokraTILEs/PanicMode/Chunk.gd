extends TileMap
class_name SokraTiles_Chunk

################################################################################
##  --- Init ---                                                              ##
################################################################################

var tilemapReference = {} # 100 x 100 dict ordered by x and y,needs to get object by ID first
func _init() -> void:
	SokraTiles.parseTilemap("res://Media/TileMap/SuburbanTestSide.json")

func fillDictsForXRef(layerToParse):
	for i in layerToParse.size():
		tilemapReference[i]={}
		for j in layerToParse[i].size():
			
			var currentEnt = layerToParse[j][i]
			if !str(currentEnt) == str("-1"):
				AddTextureAtlasNrToEnt(currentEnt)
				tilemapReference[i][j] = currentEnt.get_instance_id()
			else:
				tilemapReference[i][j] = "-1"
			

func AddTextureAtlasNrToEnt(ent:TileEntity):
	var cache = self.tile_set.find_tile_by_name( ent.textureID() )
	ent.staticTilesetCellNr = Comp_Tile_StaticTilesetCellNr.new(cache)



################################################################################
##  --- GETTER / VALIDATOR ---                                                ##
################################################################################

func getTileEntByPos(xPos:int, yPos:int) -> TileEntity:
	if !isTileEmpty(xPos, yPos):
		var cellID = tilemapReference [xPos][yPos]
		var ent = instance_from_id(cellID)
		return ent
	return null

func getTilemapReference():
	return tilemapReference

func getTextureAtlasNr(ent:TileEntity) -> int:
	return tile_set.find_tile_by_name(ent.textureID())

func isTileEmpty(xPos:int,yPos:int):
	return str(tilemapReference[xPos][yPos]) == str("-1")



################################################################################
##  --- DRAW ---                                                              ##
################################################################################

func drawWholeLayer() -> void:
	for i in tilemapReference.size():
		for j in tilemapReference[i].size():
			drawTileByPos(i,j)

func drawTileByPos(xPos:int, yPos:int) -> void:
	if !isTileEmpty(xPos,yPos):
		var ent = getTileEntByPos(xPos,yPos)
		var tileNr = getTextureAtlasNr(ent)
		set_cell(xPos,yPos,tileNr)


func setCell(xPos:int,yPos:int,textureId):
	var saniticedTextureId :int = int(textureId)
	set_cell(xPos,yPos,saniticedTextureId)


