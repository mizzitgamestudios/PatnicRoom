extends Node
class_name _Enum_Input_Panic


var ENUMS_TO_STRING = {
	 "MOVEMENT"     : MOVEMENT
	,"INTERFACE"    : INTERFACE
	,"ACTION"       : ACTION
	,"INFO"         : INFO
	,"PLAYER_STATE" : PLAYER_STATE
	,"INPUT_MODE"   : INPUT_MODE
}



enum MOVEMENT  {  NORTH  =  0 , WEST     =  1 , SOUTH    =  2   , EAST   =  3                                        }
enum INFO      {  JURNAL =  4 , MONITOR  =  5 , NEWS     =  6   , KITS   =  7  ,  CLI       =  8                     }
enum ACTION    {  SELECT =  9 , INTERACT = 10 , PARCTISE = 11   , ONLOOK = 12  ,  LOOT      = 13 , USE         = 14  }
enum INTERFACE {  CNTL   = 15 , DELETE   = 16 , ESCAPE   = 17   , ENTER  = 18  , LEFT_CLICK = 19 , RIGHT_CLICK = 20  }

enum INPUT_MODE{ MOVEMENT , INFO , ACTION , INTERFACE , VOID = -1 }

var INPUTS = {
	 "MOVEMENT"  : MOVEMENT
	,"INFO"      : INFO
	,"ACTION"    : ACTION
	,"INTERFACE" : INTERFACE
}

enum PLAYER_STATE{ STANDING , SELECTING , NEEDING_DIRECTION , SELECTING_DIRECTION , INVALID , FINISHED }
