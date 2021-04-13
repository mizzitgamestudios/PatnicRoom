extends DemocrECTS_Controller


#----- INITIALICE ------------------------------------------------------------##

var createNPCProcess 
var entMan


func _init() -> void:
	self.name = "API_0007_ProcgenActor"

	entMan =_03_00_EntityManager.new()
	createNPCProcess = _007_Create_NPC_Process.new()


#----- GENERATION ------------------------------------------------------------##

func generateByJSONinTools():
	var actorReferences = Util.JSONParser.fileToDictionary("res://tools/Custome_NPC/Suburban.json")    #BOOKMARK[epic=Entities_Process] Actor JSON -> API 
	entMan.generateByArrayOfActors(actorReferences["wrapper"])


func removeActorFromGame(ent:ActorEntity):
	var arrOfComps = ent.dictOfComps.keys()
	var arrOfConds = ent.dictOfConds.keys()
	

	for i in ent.dictOfComps.size():
		if ent.dictOfComps.has(arrOfComps[i]):
			ent.dictOfComps[arrOfComps[i]].free()
	

	for i in ent.dictOfConds.size():
		if ent.dictOfConds.has(arrOfConds[i]):
			if is_instance_valid(ent.dictOfConds[arrOfConds[i]]):ent.dictOfConds[arrOfConds[i]].queue_free()
	
				
	SokraTiles.getActor().entsOnMap.erase(ent.get_instance_id())
	ent.free()
