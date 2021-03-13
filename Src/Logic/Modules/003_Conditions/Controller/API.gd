extends DemocrECTS_Controller


#----- INITIALICER ---------------------------------------------------------------##

var _conditionEntMananager : _003_ConditionManager
var _conditionIndex        : _003_ConditionIndex


func _init() -> void:
	self.name = "API_001_Conditions"

	_conditionIndex        = _003_ConditionIndex.new()
	_conditionEntMananager = _003_ConditionManager.new()

	_conditionIndex.initialice()



#----- GETTER ---------------------------------------------------------------##

#VAR ent: Entity to COnnect it to               
#VAR condName: Name of Class in String          
#VAR duration: in Movements                     
#VAR intensity: very Classdependent,default = 0 
func attachConditionToEnt(ent:Entity, condName:String, duration:int, var intensity:int=0):
	print("condition"+condName+" an "+ent.mouseHover_quack())
	_conditionEntMananager.construct(ent,condName,duration,intensity)
	SokraTiles.getCondition().addLayerEntry(ent,API_003_Condition.getAllConditions()[condName].textureID_quack())

	
func getAllConditions():
	return _conditionIndex.conditionIndex


#VAR conditionName: Name of Class in String 
func getCondition(conditionName:String):
	if API_003_Condition.getAllConditions().has(conditionName):
		return API_003_Condition.getAllConditions()[conditionName]
	
	
	
