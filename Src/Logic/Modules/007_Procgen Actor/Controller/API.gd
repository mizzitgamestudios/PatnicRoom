extends DemocrECTS_Controller


########################
# --- Variables ------ #
########################
var validator
var logger
var tileEntManager
var createNPCProcess 
var actorsOnMap: Dictionary = {}
var entMan



########################
# --- Init ----------- #
########################
func _init() -> void:
	self.name = "API_0007_ProcgenActor"
	actorsOnMap = self._dict_component_index

	validator = _03_00_Validator.new()
	logger = _03_00_Logger.new()
	entMan =_03_00_EntityManager.new()
	createNPCProcess = _007_Create_NPC_Process.new()


########################
# --- Functions ------ #
########################

func generateByJSONinTools():
	var actorReferences = Util.JSONParser.fileToDictionary("res://tools/Custome_NPC/Suburban.json")    # <--- INSERT FILEPATH HERE
	entMan.generateByArrayOfActors(actorReferences["wrapper"])
