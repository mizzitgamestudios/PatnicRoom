extends DemocrECTS_Controller


#----- INITIALICER ---------------------------------------------------------------##

var _select       : _005_Select
var _getter       : _005_Get
var _kitSetMerger : _005_KitSetMerger
var _kitSelect    : _5_KitSelect


func _ready() -> void:
	_kitSetMerger = _005_KitSetMerger.new()
	_getter       = _005_Get.new()
	_select       = _005_Select.new()
	_kitSelect    = _5_KitSelect.new()



#----- INITIALICER ---------------------------------------------------------------##

func addKitsetToEnt(arrayOfKitparts:Array):
	pass # TODO:                            

func addKitsetToPlayer(arrayOfKitparts:Array):
	return _kitSetMerger.mergeKitParts(arrayOfKitparts)



#----- PROCESS -------------------------------------------------------------------##

# REVIEW: prozess jetzt in einer einzigen (flüssigeren/übersichtlicheren) funktion
func getKitSelect(kitSet:KitSetEntity):
	_kitSelect.getKitSelect(kitSet)

func setDirectionOfKitset(directionEnum,kitset):
	_kitSelect.setDirectionOfKitset(directionEnum,kitset)

#----- GETTER --------------------------------------------------------------------##

func getSlot(kitset:KitSetEntity,kitPart:String,unit:int,slot:String):  return _getter.getSlot(kitset,kitPart,unit,slot)
func getUnit(kitset:KitSetEntity,kitPart:String,unit:int):              return _getter.getUnit(kitset,kitPart,unit)
func getKitPart(kitset:KitSetEntity,kitPart:String):                    return _getter.getKitPart(kitset,kitPart)
func getInitialSlot(kitSet:KitSetEntity,slotName:String):               return getSlot(kitSet,kitSet.initialSelect[0],kitSet.initialSelect[1],slotName)

#FUNC after first initial Select of Kit, it will be cached 
func getInitialKitsetSelect(kitset:KitSetEntity):
	_select.getInitialKitsetSelect(kitset)






func runKitSet(kitset):
	var selectedTiles    = API_011_Player.getSelectedTilesComp().getAlerted()
	var initialCondition = kitset.initialSelect["EFFECT_CONDITION"]
	var initialStat      = kitset.initialSelect["EFFECT_STAT_MOD"]
	
	for i in initialStat.statModList.size():
		var currentStat = initialStat.statModList[i]
		
		
		if currentStat[0] == "C_46_ANY_HITPOINTS": 
			damageEnt(selectedTiles.back(),currentStat)
	
		elif currentStat[0] == "U_CHANGE_TEXTURE":
			API_014_TilemapSelector.manageToHegel(selectedTiles.back(),"changeTexture",currentStat[1],currentStat[0])
	
		else:
			API_014_TilemapSelector.manageToHegel(selectedTiles.back(),"changeStat",currentStat[1],currentStat[0])
	
	
	API_011_Player.getSelectedTilesComp().resetAlerted()
	

func damageEnt(arr,currentStat):
	for i in arr.size():
		if arr[i] is ActorEntity:
		
			var hitpoints =int(arr[i].hitpoints())
			var takeAway = int(currentStat[1])
			hitpoints += takeAway
			if hitpoints <=0: 
				SokraTiles.Actors_on_map.erase(arr[i].get_instance_id())
