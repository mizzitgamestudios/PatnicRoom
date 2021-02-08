extends Object
class_name _010_Out


static func emit_playerTurnFinished():
	Signals.emit_signal("Player_Turn_Finished")



static func emit_effectTurnStarted():
	Signals.emit_signal("Effect_Turn_Started")

static func emit_effectTurnFinished():
	Signals.emit_signal("Effect_Turn_Finished")





