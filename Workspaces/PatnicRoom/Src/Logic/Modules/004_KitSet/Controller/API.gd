extends DemocrECTS_Controller



# DOCS  docs/docs/Modules/004.md                                                  
# BOOKMARK[epic=Modules] 004_KitSet                                                
# ----- INITIALICER -------------------------------------------------------------- ##

var _select       : _005_Select
var _getter       : _005_Get
var _kitSetMerger : _005_KitSetMerger
var _kitSelect    : _5_KitSelect
var _kitRun       : _5_KitRun

 
func _ready() -> void:
	_kitSetMerger = _005_KitSetMerger.new()
	_getter       = _005_Get.new()
	_select       = _005_Select.new()
	_kitSelect    = _5_KitSelect.new()
	_kitRun       = _5_KitRun.new()



# ----- INITIALICER -------------------------------------------------------------- ##

# STUB   
func addKitsetToEnt(arrayOfKitparts:Array):
	pass  

func addKitsetToPlayer(arrayOfKitparts:Array):
	return _kitSetMerger.mergeKitParts(arrayOfKitparts)



# ----- PROCESS ------------------------------------------------------------------ ##

# REVIEW prozess jetzt in einer einzigen (flüssigeren/übersichtlicheren) funktion 
func getKitSelect(kitSet:KitSetEntity):
	_kitSelect.getKitSelect(kitSet)

func setDirectionOfKitset(directionEnum,kitset):
	_kitSelect.setDirectionOfKitset(directionEnum,kitset)

func runKitSet(kitset):
	_kitRun.runKitSet(kitset)

# ----- GETTER ------------------------------------------------------------------- ##

func getSlot(kitset:KitSetEntity,kitPart:String,unit:int,slot:String):  return _getter.getSlot(kitset,kitPart,unit,slot)
func getUnit(kitset:KitSetEntity,kitPart:String,unit:int):              return _getter.getUnit(kitset,kitPart,unit)
func getKitPart(kitset:KitSetEntity,kitPart:String):                    return _getter.getKitPart(kitset,kitPart)
func getInitialSlot(kitSet:KitSetEntity,slotName:String):               return getSlot(kitSet,"KITSET",kitSet.initialSelect[1],slotName)

# FUNC after first initial Select of Kit, it will be cached 
func getInitialKitsetSelect(kitset:KitSetEntity):
	_select.getInitialKitsetSelect(kitset)







	


