extends Node


func hasEnum(dic_enum,enumNumber_enumString):
	return dic_enum.has(enumNumber_enumString)

enum TYPES_ON_MAP{TILE,ACTOR,INTERACT,MARKER,PLAYER,LOOT_SOURCE}

var DICT_TYPES_ON_MAP = {
	"TILE"        : "TILE",
	"INTERACT"    : "INTERACT",
	"ACTOR"       : "ACTOR",
	"LOOT_SOURCE" : "LOOT_SOURCE"
}

#----- PLAYER ---------------------------------------------------------------##

const PLAYER_MAX_TEAM_COMP = 4

const SKILL = {
	DIVING             = "DIVING",
	FREE_FALL          = "FREE_FALL",
	
	LOCKSMITH          = "LOCKSMITH",
	PALMING            = "PALMING",
	GYMNASTIC          = "GYMNASTIC",
	SNEAKING           = "SNEAKING",

	RUNNING            = "RUNNING",
	SWIMMING           = "SWIMMING",

	SURVIVAL           = "SURVIVAL",
	ASTRAL_COMBAT      = "ASTRAL_COMBAT",

	ARCANA             = "ARCANA",
	MECHANICS          = "MECHANICS",
	CHEMISTRY          = "CHEMISTRY",
	FIRST_AID          = "FIRST_AID",
	MEDININE           = "MEDININE",
	BIOTECHNOLOGY      = "BIOTECHNOLOGY",
	COMPUTER           = "COMPUTER",
	ELECTRONIC_WARFRAE = "ELECTRONIC_WARFRAE",
	SOFTWARE           = "SOFTWARE",

	ARTISAN            = "ARTISAN",
	DISGUISE           = "DISGUISE",
	PERCEPTION         = "PERCEPTION",
	ASSENSING          = "ASSENSING",
	NAVIGATION         = "NAVIGATION",

	CON                = "CON",
	LEADERSHIP         = "LEADERSHIP",
	ANIMAL_HANDLING    = "ANIMAL_HANDLING",
	ETTIUETTE          = "ETTIUETTE",
	INTIMIDATION       = "INTIMIDATION",
	NEGOTIATION        = "NEGOTIATION",
	IMPERSONATION      = "IMPERSONATION"
}



const ECTS_GROUP_DELIMETER = "-"


#----- ENTITIES -------------------------------------------------------------##

var MINIMAL_COMP_TILE_ENT     = [C_0_ANY_DESCRIPTION,C_1_ANY_IS_WALKABLE,C_2_ANY_TEXTURE_ID,C_3_ANY_LAYER,C_4_ANY_MAGIC_NOISE,C_5_ANY_MATRIX_NOISE,C_6_TILE_NAME,C_7_TILE_STATIC_TILESET_NR]
var MINIMAL_COMP_ACTOR_ENT    = [C_7_TILE_STATIC_TILESET_NR,C_6_TILE_NAME,C_2_ANY_TEXTURE_ID,C_47_ANY_SYNONYM,C_19_ACTOR_ATTRIBUTES,C_20_ACTOR_SKILLBLOCK,C_26_ACTOR_INDIRECT_STATS]
var MINIMAL_COMP_INTERACT_ENT = [C_7_TILE_STATIC_TILESET_NR,C_3_ANY_LAYER,C_6_TILE_NAME,C_2_ANY_TEXTURE_ID,C_0_ANY_DESCRIPTION,C_4_ANY_MAGIC_NOISE,C_5_ANY_MATRIX_NOISE]
var MINIMAL_COMP_KITPART_ENT  = [C_37_ANY_M_TYPE,C_31_KIT_CAT_TYPE,C_35_KIT_MECHANICAL_SUMMARY,C_37_ANY_M_TYPE,C_31_KIT_CAT_TYPE,C_38_KIT_PART_TYPE,C_36_KIT_MOD_TIME,C_33_KIT_COOLDOWN_TIMER,C_48_ANY_RARITY,C_49_EFFECT_REFERENCE]
var MINIMAL_COMP_LOOT_ENT = [C_7_TILE_STATIC_TILESET_NR,C_3_ANY_LAYER,C_6_TILE_NAME,C_2_ANY_TEXTURE_ID,C_0_ANY_DESCRIPTION,C_4_ANY_MAGIC_NOISE,C_5_ANY_MATRIX_NOISE,C_61_LOOT_TABLE,C_62_LOOT_STATE]
const MINIMAL_COMP_EFFECT_ENT   = [Effect_Unit_Component,Effect_Unit_Component,Effect_Unit_Component,Effect_Unit_Component]
const MINIMAL_COMP_EFFECT_UNIT  = [Effect_Comp_EFFECT_Condition,Effect_Comp_EFFECT_Statmod,Effect_Comp_TRIGGER_Base,Effect_Comp_TRIGGER_Specific,Effect_Comp_TIME,Effect_Comp_SPACE]


var KIT_CATEGORIES = {
	"MATRIX" : ["CYBERWARE", "HACK",  "DRONE"],
	"MAGIC"  : ["INFUSION",  "SPELL", "RITE"],
	"MEAT"   : ["MEELE",     "GUN",   "ARMOR"]
}
var KIT_PARTS = {
	"BASE"     : "BASE",
	"MOD"      : "MOD",
	"APPENDIX" : "APPENDIX"
}



#----- DIOJSON --------------------------------------------------------------##

const BASE_GAME_DATA_PATH = "res://Gamedata/Stable/"

const JSON_KEY_TYPE = {
	ENTRY_SIMPLE = "ENTRY_SIMPLE",
	ENTRY_CONTAINER = "ENTRY_CONTAINER",
	ENTRY_ARRAY = "ENTRY_ARRAY",
	ENTRY_DICTIONARY = "ENTRY_DICTIONARY",
	TEMPLATE = "TEMPLATE",
	ENTRY_EFFECT = "ENTRY_EFFECT",
	META = "META",
	FLAG = "FLAG"
}
enum JSON_VALUE_TYPE{
	RANDOM = 1,
	CHANCE = 2,
}



#----- SOKRATILES -----------------------------------------------------------##

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

const M_TYPES = {
	"MEAT" : "MEAT", 
	"MAGIC" : "MAGIC", 
	"MATRIX" : "MATRIX"
}

enum ACTION_PHASE{
	EFFECT_DONE = 0,
	PLAYER_DONE = 1,
	NPC_DONE = 2
}



#----- PANIC MDOE -----------------------------------------------------------##


var WALK_ACTIONS_BY_DIRECTION = [
	"N/A",
	"Panic_Walk_North",
	"Panic_Walk_East",
	"Panic_Walk_South",
	"Panic_Walk_West"
]


const PANIC_TILE_PIXEL_SIZE = 16
const PANIC_CENTER_TO_DRAW  = Vector2(32,31)

enum DIRECTION_FOUR {
	NORTH      = 1,
	EAST       = 2,
	SOUTH      = 3,
	WEST       = 4
}

var MOUSE_INPUT_MODE = {
	"ONLOOK" : "ONLOOK",
	"LOOT"   : "LOOT"
}


#----- EXCEPTION ------------------------------------------------------------##

const EXCEPTION_TYPE={
	"1" : "X in Y not found",
	"2" : "X already in Y"
}



#----- ITEMS ----------------------------------------------------------------##

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

enum ROUND_EFFECT_PHASE{
	SPAWN  = 1,
	ONSET  = 2,
	HIT    = 3,
	OFFSET = 4
}


enum PANIC_INTERFACE_STATE{
	ROOT     = 0,
	
	KITS     = 1,
	JURNAL   = 2,
	NEWS     = 3,
	MONITOR  = 4,
	
	ONLOOK   = 5,
	USE      = 6,
	INTERACT = 7,
	LOOT     = 8,
	PARCTISE = 9
}

enum PANIC_PLAYER_STATE{
	STANDING  = 10,
	SELECTING = 11,
	NEEDING_DIRECTION = 12,
	SELECTING_DIRECTION = 13,
	INVALID = 14
}





enum KITSET_PHASE {
	SPAWN  = 1,
	ONSET  = 2,
	HIT    = 3,
	OFFSET = 4
}





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
