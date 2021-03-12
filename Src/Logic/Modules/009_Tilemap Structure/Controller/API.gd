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

var dirtyTiles = []

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


func appendDirtyTiles(layerNode,tile):
	dirtyTiles.append([ [layerNode], [tile]])


func updateDirtyTiles():
	for i in dirtyTiles.size():
		
		var currentNode = dirtyTiles[i][0][0]
		var currentTile = dirtyTiles[i][1][0]
		
		var pos = currentTile.pos()
		
		currentNode.drawCell_quack(currentTile.textureID(),currentTile.pos())
