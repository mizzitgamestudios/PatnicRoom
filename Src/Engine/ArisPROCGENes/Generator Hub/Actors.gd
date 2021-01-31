###############################################################################################################################
#                                                                                                                             #
# Klasse:		Actors                                                                                                        #
# description:	Generates diffrent types of NPC who can act on a Tilemap,RNG and predifned JSON as well                       #
#                                                                                                                             #
# data flow:	External JSON -> Tilemap(ActorLayer)                                                                          #
# often called:	N/A                                                                                                           #
#                                                                                                                             #
###############################################################################################################################

extends Node
class_name GeneratorHubActors



########################
# --- Variables ------ #
########################
var listOfActorsOnMap: Array = [];



########################
# --- Custom --------- #
########################
func generateByJSONinTools():
	var actorReferences = Util.JSONParser.fileToDictionary("res://tools/Custome_NPC/Suburban.json")    # <--- INSERT FILEPATH HERE
	generateByArrayOfActors(actorReferences["wrapper"])



########################
# --- Subfunctions --- #
########################
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
