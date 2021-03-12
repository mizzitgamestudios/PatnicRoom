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
