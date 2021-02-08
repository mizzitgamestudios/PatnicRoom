extends DemocrECTS_Controller



var playerTurn: bool = false
var playerPos:Vector2
var actorLayer
var _in 
var _out 

var _tilemapLayerNodes # gets its node when Panicmode is entered
var _tileInterpreter


func _ready():
	_tileInterpreter = _TileInterpreter.new()
	
	_out = _010_Out.new()
	_in = _010_In.new()


func startNewRound():
	_out.emit_effectTurnStarted()
	_out.emit_effectTurnFinished()


func _on_PlayerTurnStarted():
	playerTurn = true
func _on_PlayerTurnFinished():
	playerTurn = false
func isPlayerTurn():
	return playerTurn

func getPlayerPos():
	return playerPos

