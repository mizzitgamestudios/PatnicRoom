extends Node
class_name _03_00_EntityManager


func generateByArrayOfActors(actors:Array) -> void:
	for i in actors.size():
		var actor: ActorEntity = genereateSingleActor(actors[i]);
		SokraTiles.Actors_on_map[actor.get_instance_id()] = actor
		ArisPROCGENes.actorsOnMap.append(actor) 


func genereateSingleActor(actor:Dictionary) -> ActorEntity:
	var ent:ActorEntity = API_007_ProcgenActor.createNPCProcess.createNPC(actor)
	ent.setPos(Vector2(actor["posX"],actor["posY"]))
	return ent

	
#BOOKMARK[epic=Entities_Process] Actor Entity -> Map 
func setActorOnTilemap(actor: ActorEntity) -> void:
	var pos = actor.position;
	var tets=SokraTiles.tilemap["layers"]["universal actors"]
	SokraTiles.tilemap["layers"]["universal actors"][pos.x][pos.y] = actor.tileName;

