extends Node

var DIOJSONES    := _Enum_DioJSONes.new()
var SOKRATILES   := _Enum_SokraTILES.new()

var ENTROPY      := _Enum_Entropy.new()
var ITEMS        := _Enum_Items.new()

var PLAYER       := _Enum_Player.new()
var KITS         := _Enum_Kits.new()

var INPUT_PANIC  := _Enum_Input_Panic.new()
var INPUT_REST   := _Enum_Input_Rest.new()

var MINIMAL_COMP := _Enum_MinimalComp.new()

 
var allSubEnums      = []
var allEnums         = {}
var allEnumsToString = []


func _ready() -> void:
	allSubEnums  = [DIOJSONES,SOKRATILES,ENTROPY,ITEMS,KITS,PLAYER,INPUT_PANIC,INPUT_REST,MINIMAL_COMP]
	var cache = []
	for subEnum in allSubEnums:   
		allEnumsToString += subEnum.ENUMS_TO_STRING.keys()
		cache += subEnum.ENUMS_TO_STRING.values()
	
	for i in cache.size():   allEnums[allEnumsToString[i]] = cache[i]



		

func GET_DICT_BY_CONTENT(enumContent:String)                   ->Dictionary: return getEnumByIndexName(saniticeString(enumContent))
func GET_KEYS_BY_CONTENT(enumContent:String)                   ->Array:      return GET_DICT_BY_CONTENT(enumContent).keys()
func GET_VALUES_BY_CONTENT(enumContent:String)                 ->Array:      return GET_DICT_BY_CONTENT(enumContent).values()

func HAS(enumContent:String)                                   ->bool:       return GET_DICT_BY_CONTENT(enumContent).empty()
func HAS_IN_STRING(enumContent:String,toLookThrough:String)    ->bool:       return GET_VALUES_BY_CONTENT(toLookThrough).has(enumContent)
func HAS_IN_DICT(enumContent:String,toLookThrough:Dictionary)  ->bool:       return toLookThrough.keys().has(saniticeString(enumContent))
func HAS_IN_ARRAY(enumContent:String,toLookThrough:Array)      ->bool:       return toLookThrough.has(saniticeString(enumContent))

func GET_IN_STRING(enumContent:String,toLookThrough:String)    ->int:       return GET_KEYS_BY_CONTENT(toLookThrough).find(saniticeString(enumContent))
func GET_IN_DICT(enumContent:String,toLookThrough:Dictionary)  ->int:       return toLookThrough.keys().find(saniticeString(enumContent))
func GET_IN_ARRAY(enumContent:String,toLookThrough:Array)      ->int:       return toLookThrough.find(saniticeString(enumContent))


	

func saniticeString(string:String)->String:
	var stringToReturn = ""
	# Plural
	if string.ends_with("s"): 
		for i in string.length()-1: stringToReturn += string[i]
	else: stringToReturn = string
	
	return stringToReturn.to_upper()



func getEnumByIndexName(stringOfEnum:String)->Dictionary:
	for enumToString in allEnumsToString:
		if enumToString.to_upper() == stringOfEnum:
			return allEnums[enumToString]
	return {}






# ----- ENTITIES ------------------------------------------------------------ ##

enum GAMELOOP_STATE { TITLE , PANIC , REST }

enum EXCEPTION_TYPE{
	X_IN_Y_NOT_FOUND
	X_ALREADY_IN_Y
}


# ORDER IS RELEVANT
var ALL_INPUTS = [
	# MOVEMENT
	 "Panic_Walk_North","Panic_Walk_West","Panic_Walk_South","Panic_Walk_East"
	# INFO
	,"Panic_Info_Jur","Panic_Info_Mon","Panic_Info_News","Panic_Info_Kits","Panic_Special_CLI"
	# ACTION
	,"Panic_Action_Selection","Panic_Action_Interact","Panic_Action_Practise","Panic_Action_Onlook","Panic_Action_Loot","Panic_Action_Use"
	 # INTERFACE
	,"Interface_Cntl","Interface_delete","Interface_Generall_Escape","Interface_Generall_Enter","Interface_LeftClick","Interface_RightClick" 
	]





