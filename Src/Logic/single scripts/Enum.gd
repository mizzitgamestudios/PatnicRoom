extends Node

##############################################################################
##  --- PLAYER  ---                                                         ##
##############################################################################

const PLAYER_MAX_TEAM_COMP = 4

const SKILL = {
	DIVING = "DIVING",
	FREE_FALL = "FREE_FALL",
	
	LOCKSMITH = "LOCKSMITH",
	PALMING = "PALMING",
	GYMNASTIC = "GYMNASTIC",
	SNEAKING = "SNEAKING",


	RUNNING = "RUNNING",
	SWIMMING = "SWIMMING",

	SURVIVAL = "SURVIVAL",
	ASTRAL_COMBAT = "ASTRAL_COMBAT",

	ARCANA = "ARCANA",
	MECHANICS = "MECHANICS",
	CHEMISTRY = "CHEMISTRY",
	FIRST_AID = "FIRST_AID",
	MEDININE = "MEDININE",
	BIOTECHNOLOGY = "BIOTECHNOLOGY",
	COMPUTER = "COMPUTER",
	ELECTRONIC_WARFRAE = "ELECTRONIC_WARFRAE",
	SOFTWARE = "SOFTWARE",

	ARTISAN = "ARTISAN",
	DISGUISE = "DISGUISE",
	PERCEPTION = "PERCEPTION",
	ASSENSING = "ASSENSING",
	NAVIGATION = "NAVIGATION",

	CON = "CON",
	LEADERSHIP = "LEADERSHIP",
	ANIMAL_HANDLING = "ANIMAL_HANDLING",
	ETTIUETTE = "ETTIUETTE",
	INTIMIDATION = "INTIMIDATION",
	NEGOTIATION = "NEGOTIATION",
	IMPERSONATION = "IMPERSONATION"
}

##############################################################################
##  --- DEMOCRECTS ---                                                      ##
##############################################################################

const ECTS_GROUP_DELIMETER = "-"
const minimalNeededComponentsForTiles = ["Comp_Tile_Description","Comp_Tile_IsWalkable","Comp_Tile_Layer","Comp_Tile_TextureID","Comp_Tile_Name","Comp_Tile_MagicNoise","Comp_Tile_MatrixNoise"]

const ATLAS_GROUPS = {
	"ITEMS":"atlas_Items",
	"RACES":"atlas_Races",
	"ANATOMIES":"atlas_Anatomies",
	"ROLES": "atlas_Roles",
	"SPECIALTIES":"atlas_Specialties",
	"BODYPARTS":"atlas_Bodyparts",
	
	
	
	"MAGIC_APPENDIX":"atlas_Magic_Appendix",
	"MEAT_APPENDIX":"atlas_Meat_Appendix",
	"MATRIX_APPENDIX":"atlas_Matrix_Appendix",
	
	
	"DRONE_MOD":"atlas_Drones_Mod",
	"DRONE_BASE":"atlas_Drones_Chassis",
	
	"HACK_BASE":"atlas_Hacks_Codebase",
	"HACK_MOD":"atlas_Hacks_Mod",
	
	"CYBERWARE_BASE":"atlas_Cyberware_Model",
	"CYBERWARE_MOD":"atlas_Cyberware_Mod",
	
	
	"INFUSION_BASE":"atlas_Infusion_Tattoo",
	"INFUSION_MOD":"atlas_Infusion_Mod",
	
	"RITE_MDO":"atlas_Rite_Mod",
	"RITE_MOD":"atlas_Rite_Sacrifice",
	
	"SPELL_BASE":"atlas_Spell_Form",
	"SPELL_MOD":"atlas_Spell_Mod",
	
	
	"MEELE_BASE":"atlas_Meele_Type",
	"MEELE_MOD":"atlas_Meele_Mod",
	
	"GUN_BASE":"atlas_Gun_Frame",
	"GUN_MOD":"atlas_Gun_Mod",
	
	"ARMOR_BASE":"atlas_Armor_Backslot",
	"ARMOR_MOD":"atlas_Armor_Mod"
	
	}


##############################################################################
##  --- DIOJSONES ---                                                      ##
##############################################################################

const BASE_GAME_DATA_PATH = "res://Gamedata/"

const JSON_KEY_TYPE = {
	ENTRY_SIMPLE = "ENTRY_SIMPLE",
	ENTRY_CONTAINER = "ENTRY_CONTAINER",
	ENTRY_ARRAY = "ENTRY_ARRAY",
	ENTRY_DICTIONARY = "ENTRY_DICTIONARY",
	TEMPLATE = "TEMPLATE",
	ENTRY_EFFECT = "ENTRY_EFFECT",
	META = "META",
}
enum JSON_VALUE_TYPE{
	RANDOM = 1,
	CHANCE = 2,
}

##############################################################################
##  --- SOKRATILES ---                                                      ##
##############################################################################

const SOKRATILES_LAYER = {
	MEAT_GROUND = "Meat ground",
	MEAT_INTERACTABLE = "Meat interactables",
	
	MATRIX_GROUND = "Matrix ground",
	MATRIX_INTERACTABLE = "Matrix interactables",
	
	MAGIC_GROUND = "Magic ground",
	MAGIC_INTERACTABLE = "Magic interactables",
	
	ACTOR_PLAYER = "pc",
	ACTOR_NPC = "actors"
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

##############################################################################
##  --- PANIC MODE ---                                                      ##
##############################################################################

const PANIC_WALK_DIRECTION = {
	NORTH = "Panic_Walk_North",
	SOUTH = "Panic_Walk_South",
	EAST = "Panic_Walk_East",
	WEST = "Panic_Walk_West",
}

const PANIC_TILE_PIXEL_SIZE = 16
const PANIC_CENTER_TO_DRAW = Vector2(32,37)

enum DIRECTION_EIGHT{
	NORTH = 1,
	NORTH_EAST = 5,
	EAST = 2,
	SOUTH_EAST = 6
	SOUTH = 3,
	SOUTH_WEST = 7,
	WEST = 4
	NORTH_WEST = 8,
}

enum DIRECTION_FOUR{
	NORTH = 1,
	EAST = 2,
	SOUTH = 3,
	WEST = 4
}



##############################################################################
##  --- EXCEPTIONS ---                                                      ##
##############################################################################

const EXCEPTION_TYPE={
	"1" : "X in Y not found",
	"2" : "X already in Y"
}


##############################################################################
##  --- ITEMS META ---                                                      ##
##############################################################################

enum RARITY {
	DREK = 1,
	WORN_OUT = 2,
	DO_IT_YOURSELF = 3,
	WAGESLAVE = 4,
	INDUSTRIAL = 5,
	UPPER_CLASS = 6,
	FEDERAL = 7,
	FIXER = 8,
	ELITE_RUNNER = 9,
	MEGACON_PROTOTYPE = 10
}

const RARITY_TO_STRING = {
	1 : "Drek standard",
	2 : "Worn out standard",
	3 : "Do it yourself standard",
	4 : "Wageslave standard",
	5 : "Industrial standard",
	6 : "Upper class standard",
	7 : "Federal standard",
	8 : "Fixer standard",
	9 : "Elite runner standard",
	10 : "Megacon prototype standard"
}

const ENTROPY_SCALE={
	1 : "Masterfully crafted Clockwork",
	2 : "Tide up",
	3 : "Manageable",
	4 : "Mess",
	5 : "Pigstall",
	6 : "Chaotic",
	7 : "Left for good",
	8 : "Tipping point",
	9 : "Spiraling out!!",
	10 : "TRUE COSMIC VACUUM"
}

const ENTROPY_PROGRESS_COLOR={
	1:"#97a4c3",
	2:"#97a4c3",
	3:"#a7a7a7",
	4:"#a7a7a7",
	5:"#e7cd7b",
	6:"#e7cd7b",
	7:"#db6322",
	8:"#db6322",
	9:"#db2222",
	10:"#ff0e0e",
}

enum ROUND_EFFECT_PHASE{
	SPAWN = 1,
	ONSET = 2,
	HIT = 3,
	OFFSET = 4
}













