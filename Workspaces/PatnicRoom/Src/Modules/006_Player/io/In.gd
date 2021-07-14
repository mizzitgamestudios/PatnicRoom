extends Object
class_name _011_In


func _init():
	Signals.connect("Player_Turn_Started",self,"setPlayerTurnOn")
	Signals.connect("Player_Turn_Finished",self,"setPlayerTurnOff")


func setPlayerTurnOn():
	API_006_Player.inputMode = true


func setPlayerTurnOff():
	API_006_Player.inputMode = false

