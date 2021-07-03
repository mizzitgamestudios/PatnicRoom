extends DemocrECTS_Controller

# BOOKMARK[epic=Modules] 007_Effect                                                  
# ----- INITIALICER -------------------------------------------------------------- ##

var _complexGenerator   := _002_EntityManager.new()

var _mediumHub          := _02_MediumHub.new()
var _source             := _02_SourceHub.new()

var _TriggerBaseHub     := _02_TriggerBaseHub.new()
var _triggerSpecificHub := _02_TirggerSpecificHub.new()



# ----- GETTER ------------------------------------------------------------------- ##


#>>> TIRGGER <<<#

# FUNC gives back relevant Entities of Selected Positions by EntityType 
func getTriggerableByBase(kitSet:KitSetEntity,entsList):              
	return _TriggerBaseHub.getTriggerableByBase(kitSet,entsList)

# FUNC gives back the exact Entities Of Kit,needs [getTriggerableByBase(KitSetEntity)] at first 
func getTriggerableBySpecific(ents:KitSetEntity,collectedEnts:Array): 
	return _triggerSpecificHub.manageSpecificTrigger(ents,collectedEnts)


#>>> SPACE <<<#

# FUNC calculates and gets the selected Tiles of this Movement on Map 
func calculateSelectedPositions(space:KitSetEntity,sourcePos:Vector2):
	return _mediumHub.calculateSelectedPositions(space,sourcePos)



# ----- GETTER INITIAL ----------------------------------------------------------- ##



func getSourcePos(kitset:KitSetEntity):    return _source.getSourceSlot(kitset.initialSelect["SPACE"].source)




# FUNC CONSTRUCTOR   
func createEffectByDict(dict):
	return _complexGenerator.buildEffectProcess(dict) 


func saveEffectInKitset(kitPart):
	kitPart.effect = _complexGenerator.buildEffectProcess(kitPart.getCompValue("C_49_EFFECT_REFERENCE"))









