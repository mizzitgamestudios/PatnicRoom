extends Node
class_name GeneratorHubActors

var listOfActorsOnMap: Array = [];


func generateByJSONinTools():
	var actorReferences = Util.JSONParser.fileToDictionary("res://tools/Custome_NPC/Suburban.json")
	ArisPROCGENes.generatorHubActors.generateByArrayOfActors(actorReferences["wrapper"])







func generateByArrayOfActors(actors:Array) -> void:
	for i in actors.size():
		var actor: DynamicNPC = genereateSingleActor(actors[i]);
		setActorOnTilemap(actor);
		listOfActorsOnMap.append(actor);

func genereateSingleActor(actor:Dictionary) -> DynamicNPC:
	var pos = Vector2(actor["posX"],actor["posY"]);
	return DynamicNPC.new(pos,actor);




func setActorOnTilemap(actor: DynamicNPC) -> void:
	var pos = actor.position;
	SokraTiles.tilemap["layers"]["universal actors"][pos.x][pos.y] = actor.tileName;
