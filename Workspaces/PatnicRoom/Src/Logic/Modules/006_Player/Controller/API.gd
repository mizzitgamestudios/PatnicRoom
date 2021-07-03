extends DemocrECTS_Controller

# BOOKMARK[epic=Modules] 006_Player                                              
# ----- INITIALICE ----------------------------------------------------------- ##

var _011_in           : _011_In
var _011_charloader   : _011_CharLoader
var _011_chargen      : _011_Chargen

var inputMode         : bool = true
var currentChar       : PlayerEntity
var chargenSelecttion : Dictionary

func _ready() -> void:
	_011_in         = _011_In.new()
	_011_charloader = _011_CharLoader.new()
	_011_chargen    = _011_Chargen.new()
	
	_011_Utils.generateCharPreset()



# ----- GETTER --------------------------------------------------------------- ##

func getInputMode():
	return inputMode

func getSelectedTiles():
	return currentChar.getCompValue(C_53_Actor_SELECTED_TILE.name_quack())

func resetSelectedTiles():
	currentChar.getComp(C_53_Actor_SELECTED_TILE.name_quack()).reset()


func appendSelectedTiles(arr):
	currentChar.getComp(C_53_Actor_SELECTED_TILE.name_quack()).addToCache(arr)

func appendSelectedTilesCacheIntoPerma():
	currentChar.getComp(C_53_Actor_SELECTED_TILE.name_quack()).appendCacheIntoPerma()
# ----- CHARACTER ------------------------------------------------------------ ##

func setCurrentCharByDict(dict:Dictionary):

	_011_charloader.setCurrentCharByDict(dict)

func generateNewChar():
	_011_chargen.generateNewChar()



func getSelectedTilesComp():
	return currentChar.getComp(C_53_Actor_SELECTED_TILE.name_quack())



