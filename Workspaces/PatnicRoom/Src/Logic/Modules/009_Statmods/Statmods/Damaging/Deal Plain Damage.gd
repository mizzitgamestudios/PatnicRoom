extends Object
class_name U_DEAL_PLAIN_DAMAGE



static func run(ent, modValue):
	if ent is ActorEntity:

		ent.getComp("C_57_HITPOINTS").value = ent.getComp("C_57_HITPOINTS").value + int(modValue)
		
		var value = ent.hitpoints()

		if value <= 0: 
			API_011_ProcgenActor.removeActorFromGame(ent)

		
 
