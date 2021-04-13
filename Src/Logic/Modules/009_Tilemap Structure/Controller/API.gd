extends DemocrECTS_Controller


#----- INITIALICE ------------------------------------------------------------##

var cacheForSelection = {} 

var _in 
var _out 

var _tilemapLayerNodes # gets its node when Panicmode is entered
var _tileInterpreter

var _tilemapOfPlayer
var _actorsOnMap
var _interactablesOnMap

var dirtyTiles = {}

func _ready():
	_tileInterpreter = _TileInterpreter.new()
	_out = _010_Out.new()
	_in = _010_In.new()



#----- GETTER ----------------------------------------------------------------##

func startNewRound():
	_out.emit_effectTurnStarted()
	_out.emit_effectTurnFinished()




func interpreteTile(pos:Vector2,node:Node): 
	_tileInterpreter.interpreteTileNr(pos,node)


func appendDirtyTiles(tile):
	dirtyTiles[tile.get_instance_id()] = tile

func updateDirtyTiles():
	for i in dirtyTiles.size():
		var currentEnt = dirtyTiles.values()[i]
		
		var currentNode = getTilemapLayerByEntity(currentEnt)
		var currentTile = currentEnt
		
		var pos = currentTile.pos()
		
		currentNode.drawCell_quack(currentTile.textureID(),currentTile.pos())
	dirtyTiles = {}



func getTilemapLayerByEntity(ent):
	var entType = ent.typeToString()
	var layer   = ent.layer()
	layer = layer.replace("-"," ")
	
	match layer:
		ENUM.SOKRATILES_LAYER.MEAT_GROUND: 			return SokraTiles.getMeatFloor()
		ENUM.SOKRATILES_LAYER.MEAT_INTERACTABLE: 	return SokraTiles.getMeatInteract()
		
		ENUM.SOKRATILES_LAYER.MAGIC_GROUND: 		return SokraTiles.getMagicFloor()
		ENUM.SOKRATILES_LAYER.MAGIC_INTERACTABLE: 	return SokraTiles.getMagicInteract()
		
		ENUM.SOKRATILES_LAYER.MATRIX_GROUND:		return SokraTiles.getMatrixFloor()
		ENUM.SOKRATILES_LAYER.MATRIX_GROUND: 		return SokraTiles.getMatrixInteract()
	
	
	
	
func replaceEntOnPos(ent,pos,posAlt=0):
	if pos is int: pos = Vector2(pos,posAlt)

	var tilemapNode = getTilemapLayerByEntity(ent)
	ent.setPos(pos)

	if tilemapNode.entsOnMap.has(pos) and pos != ent.pos():
		var oldEnt = tilemapNode.entsOnMap[pos] 
		instance_from_id(oldEnt).free()

	tilemapNode.entsOnMap[pos] = ent.get_instance_id()
