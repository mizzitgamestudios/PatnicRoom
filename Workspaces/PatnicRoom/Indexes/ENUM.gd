extends Node

<<<<<<< HEAD
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
=======

func hasEnum(dic_enum,enumNumber_enumString):
	return dic_enum.has(enumNumber_enumString)




enum GAMELOOP_STATE { TITLE , PANIC , REST }

# ----- PLAYER -------------------------------------------------------------- ##

const PLAYER_MAX_TEAM_COMP = 4

enum SKILL {
	# MEAT			 # MAGIC                 # MATRIX
	CRAFTING     ,   PHYLOSOPHIZING      ,   CONCEPTUALICING        # IMPOVICING
	PERCEVING    ,   ASSENSING           ,   DEBUGGING				# FINDING SOMETHING HIDDEN
	ENDURING     ,   COPING              ,   FILTERING				# GOING THROUGH TOUGH TERRAIN
	SNEAKING     ,   REPRESSING          ,   SILENCING              # STAYING HIDDEN
}


# ----- ENTITIES ------------------------------------------------------------ ##

const MINIMAL_COMP_TILE_ENT        = [C_0_ANY_DESCRIPTION,C_1_ANY_IS_WALKABLE,C_2_ANY_TEXTURE_ID,C_3_ANY_LAYER,C_4_ANY_MAGIC_NOISE,C_5_ANY_MATRIX_NOISE,C_6_TILE_NAME,C_7_TILE_STATIC_TILESET_NR]
const MINIMAL_COMP_ACTOR_ENT       = [C_7_TILE_STATIC_TILESET_NR,C_6_TILE_NAME,C_2_ANY_TEXTURE_ID,C_47_ANY_SYNONYM,C_19_ACTOR_ATTRIBUTES,C_20_ACTOR_SKILLBLOCK,C_26_ACTOR_INDIRECT_STATS]
const MINIMAL_COMP_INTERACT_ENT    = [C_7_TILE_STATIC_TILESET_NR,C_3_ANY_LAYER,C_6_TILE_NAME,C_2_ANY_TEXTURE_ID,C_0_ANY_DESCRIPTION,C_4_ANY_MAGIC_NOISE,C_5_ANY_MATRIX_NOISE]

const MINIMAL_COMP_KITPART_ENT     = [C_37_ANY_M_TYPE,C_31_KIT_CAT_TYPE,C_35_KIT_MECHANICAL_SUMMARY,C_37_ANY_M_TYPE,C_31_KIT_CAT_TYPE,C_38_KIT_PART_TYPE,C_36_KIT_MOD_TIME,C_33_KIT_COOLDOWN_TIMER,C_48_ANY_RARITY,C_49_EFFECT_REFERENCE]
const MINIMAL_COMP_LOOT_ENT        = [C_7_TILE_STATIC_TILESET_NR,C_3_ANY_LAYER,C_6_TILE_NAME,C_2_ANY_TEXTURE_ID,C_0_ANY_DESCRIPTION,C_4_ANY_MAGIC_NOISE,C_5_ANY_MATRIX_NOISE,C_61_LOOT_TABLE,C_62_LOOT_STATE]

const MINIMAL_COMP_EFFECT_ENT      = [Effect_Unit_Component,Effect_Unit_Component,Effect_Unit_Component,Effect_Unit_Component]
const MINIMAL_COMP_EFFECT_UNIT     = [Effect_Comp_EFFECT_Condition,Effect_Comp_EFFECT_Statmod,Effect_Comp_TRIGGER_Base,Effect_Comp_TRIGGER_Specific,Effect_Comp_TIME,Effect_Comp_SPACE]


# ----- KITS ---------------------------------------------------------------- ##

enum KIT_PARTS { BASE , MOD , APPENDIX }

enum KIT_CAT_MATRIX { HACK , DRONE , CYBERWARE }
enum KIT_CAT_MAGIC  { RITE , SPELL , INFUSION  }
enum KIT_CAT_MEAT   { GUN  , MEELE , ARMOR     }

enum KIT_CATEGORY { HACK  , DRONE , CYBERWARE	# MATRIX
					RITE  , SPELL , INFUSION	# MAGIC
					GUN   , MEELE , ARMOR	 }	# MEAT


enum KITSET_PHASE {
	SPAWN  = 1,
	ONSET  = 2,
	HIT    = 3,
	OFFSET = 4
}


# ----- DIOJSON ------------------------------------------------------------- ##

const BASE_GAME_DATA_PATH = "res://Gamedata"

enum JSON_VALUE_TYPE{
	RANDOM = 1,
	CHANCE = 2,
}


# ----- SOKRATILES ---------------------------------------------------------- ##

enum ACTION_PHASE{ EFFECT_DONE , PLAYER_DONE , NPC_DONE }

enum M_TYPE { MEAT , MAGIC , MATRIX }


enum TYPES_ON_MAP { TILE   , ACTOR  , INTERACT       # CORE
					MARKER , PLAYER , LOOT_SOURCE }  # MISC


const PANIC_CENTER_TO_DRAW  = Vector2(32,31)
const PANIC_TILE_PIXEL_SIZE = 16

enum MOUSE_INPUT_MODE{ ONLOOK , LOOT }


# order has relevance in inital parsing of Map
const SOKRATILES_LAYER = {
	ACTOR_NPC = "actors",
	ACTOR_PLAYER = "pc",
	
	MEAT_GROUND = "Meat ground",
	MEAT_INTERACTABLE = "Meat interactables",
	
	MATRIX_GROUND = "Matrix ground",
	MATRIX_INTERACTABLE = "Matrix interactables",
	
	MAGIC_GROUND = "Magic ground",
	MAGIC_INTERACTABLE = "Magic interactables",
	
	
	SELECTION = "selection",
	CONDITION = "condition"
}


# ----- PANIC_MDOE ---------------------------------------------------------- ##

var WALK_ACTIONS_BY_DIRECTION = [
	"Panic_Walk_North",
	"Panic_Walk_East",
	"Panic_Walk_South",
	"Panic_Walk_West"
]

enum DIRECTION_FOUR {
	NORTH
	EAST
	SOUTH
	WEST
}


# ----- EXCEPTION ----------------------------------------------------------- ##
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684

enum EXCEPTION_TYPE{
	X_IN_Y_NOT_FOUND
	X_ALREADY_IN_Y
}


<<<<<<< HEAD
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





=======
# ----- ITEMS --------------------------------------------------------------- ##

enum RARITY {
	DREK              = 1,
	WORN_OUT          = 2,
	DO_IT_YOURSELF    = 3,
	WAGESLAVE         = 4,
	INDUSTRIAL        = 5,
	UPPER_CLASS       = 6,
	FEDERAL           = 7,
	FIXER             = 8,
	ELITE_RUNNER      = 9,
	MEGACON_PROTOTYPE = 10
}

const RARITY_TO_STRING = {
	1  : "Drek standard",
	2  : "Worn out standard",
	3  : "Do it yourself standard",
	4  : "Wageslave standard",
	5  : "Industrial standard",
	6  : "Upper class standard",
	7  : "Federal standard",
	8  : "Fixer standard",
	9  : "Elite runner standard",
	10 : "Megacon prototype standard"
}


# ----- ENTROPY ------------------------------------------------------------- ##

const ENTROPY_SCALE = {
	1  : "Masterfully crafted Clockwork",
	2  : "Tide up",
	3  : "Manageable",
	4  : "Mess",
	5  : "Pigstall",
	6  : "Chaotic",
	7  : "Left for good",
	8  : "Tipping point",
	9  : "Spiraling out!!",
	10 : "TRUE COSMIC VACUUM"
}

const ENTROPY_PROGRESS_COLOR={
	1  : "#97a4c3",
	2  : "#97a4c3",
	3  : "#a7a7a7",
	4  : "#a7a7a7",
	5  : "#e7cd7b",
	6  : "#e7cd7b",
	7  : "#db6322",
	8  : "#db6322",
	9  : "#db2222",
	10 : "#ff0e0e",
}

# ----- INPUT ------------------------------....----------------------------- ##


var ALL_INPUTS = [ # RODER IS RELEVANT
	 "Panic_Walk_North","Panic_Walk_West","Panic_Walk_South","Panic_Walk_East"   # MOVEMENT
	,"Panic_Info_Jur","Panic_Info_Mon","Panic_Info_News","Panic_Info_Kits","Panic_Special_CLI"   # INFO
	,"Panic_Action_Selection","Panic_Action_Interact","Panic_Action_Practise","Panic_Action_Onlook","Panic_Action_Loot","Panic_Action_Use"   # ACTION
	,"Interface_Cntl","Interface_delete","Interface_Generall_Escape","Interface_Generall_Enter","Interface_LeftClick","Interface_RightClick"  # INTERFACE
]

enum MOVEMENT  {  NORTH  =  0 , WEST     =  1 , SOUTH    =  2   , EAST   =  3                                        }
enum INFO      {  JURNAL =  4 , MONITOR  =  5 , NEWS     =  6   , KITS   =  7  ,  CLI       =  8                     }
enum ACTION    {  SELECT =  9 , INTERACT = 10 , PARCTISE = 11   , ONLOOK = 12  ,  LOOT      = 13 , USE         = 14  }
enum INTERFACE {  CNTL   = 15 , DELETE   = 16 , ESCAPE   = 17   , ENTER  = 18  , LEFT_CLICK = 19 , RIGHT_CLICK = 20  }

enum INPUT_MODE{ MOVEMENT , INFO , ACTION , INTERFACE , VOID = -1 }

# ENUM.INPUTS.MOVEMENT.NORTH
var INPUTS = {
	 "MOVEMENT"  : MOVEMENT
	,"INFO"      : INFO
	,"ACTION"    : ACTION
	,"INTERFACE" : INTERFACE
}

enum PANIC_PLAYER_STATE{ STANDING , SELECTING , NEEDING_DIRECTION , SELECTING_DIRECTION , INVALID , FINISHED }


# ----- EFFECT -------------------------------------------------------------- ##

const EFFECT_TRIGGER_BASE = {
	"INTERACT"        : "PROJECTILE_HIT",
	"ACTOR"           : "SELF",
	"TILE"            : "TOUCHING",

	"INTERACT_ACTOR"  : "INTERACT_ACTOR",
	"INTERACT_TILE"   : "INTERACT_TILE",
	"TILE_ACTOR"      : "TILE_ACTOR",

	"ALL"             : "ALL" }

const EFFECT_TRIGGER_SPECIFIC = {
	"BASE"           : "BASE",
	"HAS_CONDITION"  : "HAS_CONDITION",
	"HAS_STAT"       : "HAS_STAT",
	"HAS_TEXTURE"	 : "HAS_TEXTURE",
	"CHANCE"         : "CHANCE" }

const EFFECT_SPACE_SOURCE = {
	"SELF"           : "SELF",
	"LAST_HIT"       : "LAST_HIT",
   "TEXTURE"		 : "TEXTURE",
	"LAST_TARGET"    : "LAST_TARGET" }

	
const EFFECT_SPACE_MEDIUM = {
	"LINEA"          : "LINEA",
	"SELECT"         : "SELECT",
	"AREA"           : "AREA",
	"SELF"           : "SELF",
	"ACTOR"          : "ACTOR",
	"LINEA_AREA"     : "LINEA_AREA"}
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
