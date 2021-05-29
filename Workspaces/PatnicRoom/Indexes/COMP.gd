 extends Node


var ATLAS_INDEX_COMP = {}
var ATLAS_FLAGS      = {}

var ATLAS_COMP_INDEX = {}
var CLASSES_ARRAY
var INDEX_ARRAY

func _init() -> void:
	ATLAS_INDEX_COMP = _Comp.getComponents()
	ATLAS_FLAGS      = _Flags.getFlags()
	
	
	CLASSES_ARRAY    = ATLAS_INDEX_COMP.values()
	INDEX_ARRAY      = ATLAS_INDEX_COMP.keys()
	
	
	for i in ATLAS_INDEX_COMP.size():
		ATLAS_COMP_INDEX[CLASSES_ARRAY[i]] = INDEX_ARRAY[i]


func GET_BOTH(searchName:String, debugPara=false):
	if   ATLAS_INDEX_COMP.has(searchName):    return ATLAS_INDEX_COMP[searchName]
	elif ATLAS_FLAGS.has(searchName):         return ATLAS_FLAGS[searchName]
	elif debugPara:                           print("Compnent with name: "+searchName+" not found"); return null
	
func GET_COMPONENT(componentName:String, debugPara=false):
	if ATLAS_INDEX_COMP.has(componentName): return ATLAS_INDEX_COMP[componentName]
	elif debugPara:                         print("Compnent with name: "+componentName+" not found"); return null

func GET_FLAG(flagName:String, debugPara=false):
	if   ATLAS_FLAGS.has(flagName):         return ATLAS_FLAGS.get(flagName)
	elif debugPara:                         return print("flag with name: "+flagName+" not found")
	else:                                   return null

