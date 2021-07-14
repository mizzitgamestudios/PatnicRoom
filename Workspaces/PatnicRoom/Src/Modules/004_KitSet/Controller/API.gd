extends DemocrECTS_Controller



# DOCS  docs/docs/Modules/004.md                                                  
# BOOKMARK[epic=Modules] 004_KitSet                                                
# ----- INITIALICER -------------------------------------------------------------- ##

var _select       := _005_Select.new()
var _getter       := _005_Get.new()
var _kitSetMerger := _005_KitSetMerger.new()
var _kitSelect    := _5_KitSelect.new()
var _kitRun       := _5_KitRun.new()

 

# ----- INITIALICER -------------------------------------------------------------- ##


func addKitsetToEnt(arrayOfKitparts:Array):      pass  # STUB   
func addKitsetToPlayer(arrayOfKitparts:Array):   return _kitSetMerger.mergeKitParts(arrayOfKitparts)



# ----- PROCESS ------------------------------------------------------------------ ##


func setFinalKitSelect(kitSet:KitSetEntity):       _kitSelect.setFinalKitSelect(kitSet)
func setPreviewKitSelect(kitSet:KitSetEntity):     _kitSelect.setPreviewKitSelect(kitSet)
func setDirectionOfKitset(directionEnum,kitset):   _kitSelect.setDirectionOfKitset(directionEnum,kitset)

func runKitSet(kitset):                            _kitRun.runKitSet(kitset)



# ----- GETTER ------------------------------------------------------------------- ##


func getInitialReach(kitSet:KitSetEntity):   return int(kitSet.initialSelect["SPACE"].reach)
func getInitialMedium(kitSet:KitSetEntity):  return     kitSet.initialSelect["SPACE"].medium


func getSlot(kitset:KitSetEntity,kitPart:String,unit:int,slot:String):  return _getter.getSlot(kitset,kitPart,unit,slot)
func getUnit(kitset:KitSetEntity,kitPart:String,unit:int):              return _getter.getUnit(kitset,kitPart,unit)
func getKitPart(kitset:KitSetEntity,kitPart:String):                    return _getter.getKitPart(kitset,kitPart)
func getInitialSlot(kitSet:KitSetEntity,slotName:String):               return getSlot(kitSet,"KITSET",kitSet.initialSelect[1],slotName)



# FUNC after first initial Select of Kit, it will be cached 
func getInitialKitsetSelect(kitset:KitSetEntity):
	_select.getInitialKitsetSelect(kitset)







	


