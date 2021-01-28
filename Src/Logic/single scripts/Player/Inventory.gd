extends Node
class_name Inventory


var listOfEnts = {}
var cap
var firstAdd :bool = true
func appendGear(ent:Entity):
	if firstAdd:
		setCap()
		firstAdd = false
	else:
		listOfEnts[ent.name] = ent

func appendGearByName(ent:Entity,nameOfItem:String):
	pass


func setCap():
	cap = Player.runner.indirectStats.carriageCapacity






