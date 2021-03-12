extends Node


var addCond
var removeCond
var changeCond

var addStat
var removeStat
var changeStat


func _init():
	addCond    = HeGEL_AddCond.new()
	removeCond = HeGEL_RemoveCond.new()
	changeCond = HeGEL_ChangeCond.new()
	
	changeStat = HeGEL_ChangeStat.new()



func changeStat(comp,mod):
	changeStat.run(comp,mod)
