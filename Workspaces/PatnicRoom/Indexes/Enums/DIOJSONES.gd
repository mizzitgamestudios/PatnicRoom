extends Node
class_name _Enum_DioJSONes


var ENUMS_TO_STRING = {
	 "BASE_GAME_DATA_PATH"        : BASE_GAME_DATA_PATH
	,"BASE_GAME_STABLE_DATA_PATH" : BASE_GAME_STABLE_DATA_PATH
	,"NEEDED_PARSER"              : NEEDED_PARSER	
	,"GAME_ELEMENT_STATE"         : GAME_ELEMENT_STATE
}



const BASE_GAME_DATA_PATH        = "res://Gamedata"
const BASE_GAME_STABLE_DATA_PATH = "res://Gamedata/Stable"

enum GAME_ELEMENT_STATE { NO_TEMPLATE , IS_TEMPLATE , NEEDS_TEMPLATE }

enum NEEDED_PARSER{ 
	SIMPLE, FLAG, TEMPLATE,     # common ECS Elements 
	LOOT_TABLE, EFFECT ,        # custome Parser
	NPC_TEMPLATE     # exceptions
	}





