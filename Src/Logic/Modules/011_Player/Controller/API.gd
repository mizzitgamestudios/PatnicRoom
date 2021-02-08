extends DemocrECTS_Controller


var _011_in
var _011_charloader: _011_CharLoader
var _011_chargen: _011_Chargen

var inputMode: bool = true
var currentChar: PlayerEntity
var chargenSelecttionToLoad: Dictionary = {} 

func _ready() -> void:
	_011_in = _011_In.new()
	_011_charloader = _011_CharLoader.new()
	_011_chargen = _011_Chargen.new()
	
	_011_Utils.generateCharPreset()
	

func getInputMode():
	return inputMode

func setCurrentCharByDict(dict:Dictionary):
	_011_charloader.setCurrentCharByDict(dict)


func generateNewChar(kit:String,perk:String,race:String,name:String):
	_011_chargen.generateNewChar(kit,perk,race,name)






