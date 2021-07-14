extends Node
class_name _Enum_Input_Rest


var ENUMS_TO_STRING = {
	 "INPUT_MODE"  : INPUT_MODE
	,"SELF"        : SELF
	,"STATION"     : STATION
	,"SPECIAL"     : SPECIAL
	,"SCREEN_TYPE" : SCREEN_TYPE
	,"SCREENS"     : SCREENS
}



enum INPUT_MODE {  MOUSE , KEY  }

enum SELF    {  INVENTORY = 1  , CHAR     = 2 , ROOTNET = 3  }
enum STATION {  WORKSHOP  = 4  , TERMINAL = 5 , RETREAT = 6  }
enum SPECIAL {  PANIC     = 7                                }

enum SCREEN_TYPE {  STATION , SELF , SPECIAL  }

var SCREENS = {
	 "STATION"    : STATION
	,"SELF"       : SELF
	,"SPECIAL"    : SPECIAL
}
