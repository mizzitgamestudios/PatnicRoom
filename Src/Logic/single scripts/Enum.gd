extends Node

##############################################################################
##  --- PLAYER  ---                                                         ##
##############################################################################

const PLAYER_MAX_TEAM_COMP = 4


##############################################################################
##  --- DEMOCRECTS ---                                                      ##
##############################################################################

const ECTS_GROUP_DELIMETER = "-"



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
	META = "META",
}
enum JSON_VALUE_TYPE{
	RANDOM = 1,
	CHANCE = 2,
}

##############################################################################
##  --- DIOJSONES ---                                                      ##
##############################################################################

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

const M_TYPES = ["MEAT", "MAGIC", "MATRIX"]



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
