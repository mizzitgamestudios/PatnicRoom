extends Object
class_name _010_In


func _init():
	Signals.connect("Start_New_Round",API_009_Tilemap,"startNewRound")
	Signals.connect("Start_Panic",API_009_Tilemap,"findInteractables")
	
	
	
	
	
	
	



