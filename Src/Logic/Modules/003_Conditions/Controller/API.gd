extends DemocrECTS_Controller


########################
# --- Variables ------ #
########################
var validator
var logger
var tileEntManager
var atlasTiles: Dictionary = {}
var entMan



########################
# --- Init ----------- #
########################
func _init() -> void:
	self.name = "API_001_Conditions"
	atlasTiles = self._dict_component_index

	validator = _01_01_Validator.new()
	logger = _01_01_Logger.new()
	entMan=_01_01_ConditionManager.new()


########################
# --- Functions ------ #
########################
func giveEntCondition(ent:Entity, condName:String, duration:int, var intensity:int=0):
	entMan.construct(ent,condName,duration,intensity)

func getAllConditions():
	return _01_01_CompIndex.getIndex()
