extends Node
class_name _Enum_SokraTILES

var ENUMS_TO_STRING = {
	 "TYPES_ON_MAP"     : TYPES_ON_MAP
	,"ACTION_PHASE"     : ACTION_PHASE
	,"M_TYPE"           : M_TYPE
	,"CENTER_TO_DRAW"   : CENTER_TO_DRAW
	,"TILE_PIXEL_SIZE"  : TILE_PIXEL_SIZE
	,"MOUSE_INPUT_MODE" : MOUSE_INPUT_MODE
	,"DIRECTION_FOUR"   : DIRECTION_FOUR
	,"LAYER"            : LAYER
}




enum TYPES_ON_MAP { TILE   , ACTOR  , INTERACT       # CORE
					MARKER , PLAYER , LOOT_SOURCE }  # MISC


enum ACTION_PHASE {  EFFECT_DONE , PLAYER_DONE , NPC_DONE  }

enum M_TYPE {  MEAT , MAGIC , MATRIX  }


const CENTER_TO_DRAW  = Vector2(32,31)
const TILE_PIXEL_SIZE = 16


enum MOUSE_INPUT_MODE{  ONLOOK , LOOT  }

enum DIRECTION_FOUR {
	NORTH
	EAST
	SOUTH
	WEST
}

# ORDER IS RELEVANT
const LAYER = {
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
