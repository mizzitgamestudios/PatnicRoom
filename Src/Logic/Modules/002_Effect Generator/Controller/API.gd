extends DemocrECTS_Controller


#----- INITIALICER ---------------------------------------------------------------##

var _complexGenerator   : _002_EntityManager

var _mediumHub          : _02_MediumHub
var _source             : _02_SourceHub

var _TriggerBaseHub     : _02_TriggerBaseHub
var _triggerSpecificHub : _02_TirggerSpecificHub

func _init():
	_complexGenerator   = _002_EntityManager.new()
	
	# - SPACE - #
	_mediumHub          = _02_MediumHub.new()
	_source             = _02_SourceHub.new()

	# - Trigger - #
	_TriggerBaseHub     = _02_TriggerBaseHub.new()
	_triggerSpecificHub = _02_TirggerSpecificHub.new()



#----- GETTER --------------------------------------------------------------------##

#//CLASS  TRIGGER-BASE                                               

#FUNC gives back relevant Entities of Selected Positions by EntityType 
func getTriggerableByBase(kitSet:KitSetEntity,entsList):
	return _TriggerBaseHub.getTriggerableByBase(kitSet,entsList)

#FUNC gives back the exact Entities Of Kit,needs [getTriggerableByBase(KitSetEntity)] at first 
func getTriggerableBySpecific(ents:KitSetEntity,collectedEnts:Array):
	return _triggerSpecificHub.manageSpecificTrigger(ents,collectedEnts)



#//CLASS  SPACE-BASE                                                 

#FUNC calculates and gets the selected Tiles of this Movement on Map 
func calculateSelectedPositions(space:KitSetEntity,sourcePos:Vector2):
	return _mediumHub.calculateSelectedPositions(space,sourcePos)


func getSourcePos(kitset:KitSetEntity):
	return _source.getSourceSlot(kitset.initialSelect["SPACE"].source)


#FUNC CONSTRUCTOR   
func createEffectByDict(dict):
	return _complexGenerator.buildEffectProcess(dict) 












