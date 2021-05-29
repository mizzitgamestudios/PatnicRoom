extends DemocrECTS_Controller


# BOOKMARK[epic=Modules] 014_Behavior                                       


var _012_in := _012_In.new()
var actorLayer: SokraTiles_Chunk_NPC

var inputMode: bool = true


func loopThroughActor():
	var actorsOnMap_Of_API007 = SokraTiles.Actors_on_map
	var actorKeys = actorsOnMap_Of_API007.keys()
	
	for i in actorsOnMap_Of_API007.size():
		var currentEnt = actorsOnMap_Of_API007[actorKeys[i]]
		if is_instance_valid(currentEnt):
			walk(currentEnt)
		
	Signals.emit_signal("Actor_Turn_Finished",ENUM.ACTION_PHASE.NPC_DONE)



func walk(ent:ActorEntity):
	if !ent.dictOfConds.has("Physiological_Movement_Incapacitated"):
		var direction = Util.RNG.getRandomNumber(0,3)
		var directionEnum = ENUM.DIRECTION_FOUR.values()[direction]

		actorLayer = SokraTiles.getActor()
		actorLayer._drawCell(ent.textureID(), ent.pos())
		
		actorLayer.moveActor(directionEnum,ent)
		actorLayer._drawCell(ent.pos(),ent.textureID())

	






