 extends Node


var ATLAS_INDEX_CLASS       = {}
var ATLAS_INDEX_COMP        = {}
var ATLAS_FLAGS             = {}
var ATLAS_CONSUMABLE_GROUPS = {}

var ATLAS_COMP_INDEX        = {}
var CLASSES_ARRAY           = []
var INDEX_ARRAY             = []

func _init() -> void:
	ATLAS_INDEX_COMP         = _Comp.getComponents()
	ATLAS_FLAGS              = _Flags.getFlags()
	ATLAS_CONSUMABLE_GROUPS  = _Flags.getConsumableFlags()
	ATLAS_INDEX_CLASS        = _Template.getTemplate()
	
	
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
	if   ATLAS_FLAGS.has(flagName):         return flagName
	elif debugPara:                         return print("flag with name: "+flagName+" not found")
	else:                                   return null



func GET_TEMPLATE_ATLAS(tempName:String, debugPara=false):
	if   ATLAS_INDEX_CLASS.has(tempName):   return ATLAS_INDEX_CLASS[tempName]
	elif debugPara:                         return print("template with name: "+tempName+" not found")
	else:                                   return null

func GET_TEPLATE_ENTRIES(tempName:String, debugPara=false): return GET_TEMPLATE_ATLAS(tempName,debugPara).arra_entries



func HAS_COMPONENT(component, debugPara=false):
	if component is String:   return is_instance_valid( GET_COMPONENT(component,debugPara) )
	else:                     return is_instance_valid( GET_COMPONENT(component.name_quack(),debugPara) )


func HAS_FLAG(flag, debugPara=true):
	if flag is String :   return ATLAS_FLAGS.get(flag) is int
	if flag is int    :   return ATLAS_FLAGS.values().get(flag) is int


func HAS_TEMPLATE(tempName):   return ATLAS_INDEX_CLASS.has(tempName)

func HAS_DICT_TEMPLATE(dict:Dictionary): 
	for entry in dict.keys(): 
		if COMP.HAS_TEMPLATE(entry): return true
	return false
