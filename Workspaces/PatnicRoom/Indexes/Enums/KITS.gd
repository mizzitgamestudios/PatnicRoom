extends Node
class_name _Enum_Kits


var ENUMS_TO_STRING = {
	 "PARTS"        : PARTS
	,"CAT_MATRIX"   : CAT_MATRIX
	,"CAT_MAGIC"    : CAT_MAGIC
	,"CAT_MEAT"     : CAT_MEAT
	,"CATEGORY"     : CATEGORY
	,"PHASE"        : PHASE
	,"STATION_MODE" : STATION_MODE
}



enum STATION_MODE {  ADD , REMOVE , CHANGE  }

enum PARTS {  BASE , MOD , APPENDIX  }

enum CAT_MATRIX {  HACK , DRONE , CYBERWARE  }
enum CAT_MAGIC  {  RITE , SPELL , INFUSION   }
enum CAT_MEAT   {  GUN  , MEELE , ARMOR      }

enum CATEGORY { HACK  , DRONE , CYBERWARE	# MATRIX
				RITE  , SPELL , INFUSION	# MAGIC
				GUN   , MEELE , ARMOR	 }	# MEAT


enum PHASE {
	SPAWN  = 1,
	ONSET  = 2,
	HIT    = 3,
	OFFSET = 4
}


