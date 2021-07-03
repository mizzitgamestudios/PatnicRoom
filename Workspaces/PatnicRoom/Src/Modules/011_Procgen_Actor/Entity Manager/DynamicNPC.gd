extends Node
class_name _03_00_EntityManager


func generateByArrayOfActors(actors:Array) -> void:
	for i in actors.size():
		var actor: ActorEntity = genereateSingleActor(actors[i]);
		SokraTiles.Actors_on_map[actor.get_instance_id()] = actor
		ArisPROCGENes.actorsOnMap.append(actor) 


func genereateSingleActor(actor:Dictionary) -> ActorEntity:
	dynamicParserTest()
	var ent:ActorEntity = API_011_ProcgenActor.createNPCProcess._convertEnt_quack(actor,ActorEntity.new())
	ent.setPos(Vector2(actor["posX"],actor["posY"]))
	return ent

	
# BOOKMARK[epic=Entities_Process] Actor Entity -> Map 
func setActorOnTilemap(actor: ActorEntity) -> void:
	var pos = actor.position;
	var tets=SokraTiles.tilemap["layers"]["universal actors"]
	SokraTiles.tilemap["layers"]["universal actors"][pos.x][pos.y] = actor.tileName;



func dynamicParserTest():
	var texturesToSpawnOn = []
	var toGenerate = API_001_Atlas.ActorTemplateAtlas()["SUBURBAN_DEFAULT"]
	var rng = RandomNumberGenerator.new()
	
	var vects = [
		Vector2(28,76),
		Vector2(68,86),
		Vector2(38,66),
		Vector2(61,76),
		Vector2(88,91),
		Vector2(32,76),
		Vector2(68,96),
		Vector2(54,76),
		Vector2(8,76),
		Vector2(22,75),
		Vector2(68,39),
		Vector2(69,46),
		Vector2(64,76),
		Vector2(28,76),
		Vector2(28,76),
		Vector2(28,76),
		Vector2(28,76),
		Vector2(28,76),
		Vector2(28,76),
		Vector2(28,76),
	]
	
	for i in range(0,20):
		var roleSize = toGenerate.role.size()
		var raceSize = toGenerate.race.size()
		var specialtySize = toGenerate.specialty.size()
		
		var roleName = toGenerate.race [rng.randf_range(0.0, float(raceSize))].getCompValue("C_12_KITSET_INDEX")
		var raceName = toGenerate.role [rng.randf_range(0.0, float(roleSize))].getCompValue("C_12_KITSET_INDEX")
		var specialtyName = toGenerate.specialty [rng.randf_range(0.0, float(specialtySize))].getCompValue("C_12_KITSET_INDEX")
		
		var cache = {
			"C_12_FOR_RACE":roleName,
			"C_12_FOR_ROLE":raceName,
			"C_12_FOR_SPECIALTY":specialtyName
			
		}

		var ent:ActorEntity = API_011_ProcgenActor.createNPCProcess._convertEnt_quack(cache,ActorEntity.new())
		ent.setPos(Vector2(vects[i]))
		SokraTiles.Actors_on_map[ent.get_instance_id()] = ent






