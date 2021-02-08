extends DemocrECTS_Controller


var _012_in := _012_In.new()
var actorLayer: SokraTiles_Chunk_NPC

var inputMode: bool = true


func loopThroughActor():
	var actorsOnMap_Of_API007 = SokraTiles.Actors_on_map
	var actorKeys = actorsOnMap_Of_API007.keys()
	
	for i in actorsOnMap_Of_API007.size():
		var currentEnt = actorsOnMap_Of_API007[actorKeys[i]]
		walk(currentEnt)
		
	Gameloop.manageRound(ENUM.ACTION_PHASE.NPC_DONE)



func walk(ent:ActorEntity):
	var direction = Util.RNG.getRandomNumber(1,4)
	actorLayer.clearTextureOfcurrentPos(ent)
	
	match direction:
		ENUM.DIRECTION_FOUR.EAST:
			ent.position.value.x = ent.getPosX()-1
		
		ENUM.DIRECTION_FOUR.WEST:
			ent.position.value.x = ent.getPosX()+1
		
		ENUM.DIRECTION_FOUR.NORTH:
			ent.position.value.y = ent.getPosY()+1
		
		ENUM.DIRECTION_FOUR.SOUTH:
			ent.position.value.y = ent.getPosY()-1
	
	actorLayer.setCellByTextureID(ent.getPosX(),ent.getPosY(),ent.textureID())
	






