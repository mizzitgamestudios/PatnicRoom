extends DemocrECTS_Controller
# BOOKMARK[epic=Modules] 008_Conditions                                              

# ----- INITIALICER -------------------------------------------------------------- ##




func _init() -> void:
	self.name       = "API_001_Conditions"



# ----- GETTER -------------------------------------------------------------- ##

# VAR ent: Entity to COnnect it to               
# VAR condName: Name of Class in String          
# VAR duration: in Movements                     
# VAR intensity: very Classdependent,default = 0 
func attachConditionToEnt(ent, condName:String, duration:int, var intensity:int=0):
	if is_instance_valid(ent):
		print("condition"+condName+" an "+ent.mouseHover_quack())

		var conditionInstance = getConditionByName(condName).new(duration,intensity)
		conditionInstance.attachToEntWithClassName(ent)


		var indexCache   = conditionInstance.indexName_quack()
		var textureCache = conditionInstance.textureID_quack()

		SokraTiles.getCondition().addLayerEntry(ent,indexCache,textureCache)

	



func getAllConditions():
	return SYNTAX.EFFECT.EVENT_CONDITION




# VAR conditionName: Name of Class in String 
func getConditionByName(condName:String):
	if SYNTAX.EFFECT.HAS_EVENT_CONDITION(condName): return SYNTAX.EFFECT().EVENT.CONDITION[condName]
	
	
