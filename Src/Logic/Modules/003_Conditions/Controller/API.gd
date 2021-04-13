extends DemocrECTS_Controller


#----- INITIALICER ---------------------------------------------------------------##

var _conditionIndex: _003_ConditionIndex


func _init() -> void:
	self.name       = "API_001_Conditions"
	_conditionIndex = _003_ConditionIndex.new()
	_conditionIndex.initialice()



#----- GETTER ---------------------------------------------------------------##

#VAR ent: Entity to COnnect it to               
#VAR condName: Name of Class in String          
#VAR duration: in Movements                     
#VAR intensity: very Classdependent,default = 0 
func attachConditionToEnt(ent, condName:String, duration:int, var intensity:int=0):
	if is_instance_valid(ent):
		print("condition"+condName+" an "+ent.mouseHover_quack())

		var conditionInstance = getConditionByName(condName).new(duration,intensity)
		conditionInstance.attachToEntWithClassName(ent)


		var indexCache   = conditionInstance.indexName_quack()
		var textureCache = conditionInstance.textureID_quack()

		SokraTiles.getCondition().addLayerEntry(ent,indexCache,textureCache)

	



func getAllConditions():
	return _conditionIndex.conditionIndex




#VAR conditionName: Name of Class in String 
func getConditionByName(condName:String):
	if _conditionIndex.conditionIndex.has(condName): return _conditionIndex.conditionIndex[condName]
	
	
