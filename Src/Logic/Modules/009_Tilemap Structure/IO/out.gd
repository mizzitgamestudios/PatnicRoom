extends Object
class_name _010_Out


static func emit_playerTurnFinished():
	Signals.emit_signal("Player_Turn_Finished")



static func emit_effectTurnStarted():
	Signals.emit_signal("Effect_Turn_Finished_Started")

static func emit_effectTurnFinished():
	Signals.emit_signal("Effect_Turn_Finished_Finished")




static func prepareDictionary(toConvert:PoolStringArray):
	var dictToReturn : Dictionary
	
	for i in toConvert.size():
		var currentEntry = toConvert[i]
		var currentPos = currentEntry[0]
		var currentTexture = currentEntry[1]

		dictToReturn[i]["pos"] = currentPos
		dictToReturn[i]["tex"] = currentTexture
	
	return dictToReturn
