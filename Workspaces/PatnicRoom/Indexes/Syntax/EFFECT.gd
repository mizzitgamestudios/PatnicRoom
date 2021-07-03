extends Node
class_name Effect_Syntax





enum EFFECT_SYTANX_META{
	DYNAMIC_PARAMETER
	STATIC_PARAMETER
	LIST_TO_SEARCH
	TYPE
}


var TRIGGER_SPECIFIC = [
	{  "TO_STRING" : "BASE"            ,   "CLASS" : "Effect_TS_BASE"                                                                                  },
	
	{  "TO_STRING" : "IS_DOOR"         ,   "CLASS" : "Effect_TS_IS_DOOR"         ,   "STATIC_PARAMETER"  : ["OPEN","CLOSED","BOTH"]                    },
	{  "TO_STRING" : "HAS_STAT"        ,   "CLASS" : "Effect_TS_HAS_STAT"        ,   "DYNAMIC_PARAMETER" : ["COMPONENT_TO_STRING","OPERATOR","VALUE"]  },
	{  "TO_STRING" : "HAS_TEXTURE"     ,   "CLASS" : "Effect_TS_HAS_TEXTURE"     ,                                                                     },
	
	{  "TO_STRING" : "HAS_FLAG"        ,   "CLASS" : "Effect_TS_HAS_FLAG"        ,                                                                     },
	{  "TO_STRING" : "HAS_CONDITION"   ,   "CLASS" : "Effect_TS_HAS_CONDITION"   ,   "DYNAMIC_PARAMETER" : ["CONDITION_TO_STRING"]                     }
	

]




var SPACE_MEDIUM = [
	{  "TO_STRING" : "LINEA"       ,   "CLASS" : "Effect_SM_LINEA"    ,   "TYPE"  : "DIRECTIONAL"   ,   "FOOBAR" : _010_linea       },
	{  "TO_STRING" : "SELECT"      ,   "CLASS" : "Effect_SM_SELECT"   ,   "TYPE"  : "INSTANT"       ,   "FOOBAR" : _010_select      },
	{  "TO_STRING" : "AREA"        ,   "CLASS" : "Effect_SM_AREA"     ,   "TYPE"  : "INSTANT"       ,   "FOOBAR" : _010_area        },
	{  "TO_STRING" : "UNIVERSAL"   ,   "CLASS" : "Effect_SM_LINEA"    ,   "TYPE"  : "INSTANT"       ,   "FOOBAR" : _010_universal   }
	

]

var SPACE_SOURCE = [
	{  "TO_STRING" : "SELF"   ,   "CLASS" : "Effect_SS_SELF"  }
	

]







var dd = {
	"CATEGORIES":[
		{  "TO_STRING" : "SPACE"   ,   "PRIORITY" : "MANDATORY"  },
		{  "TO_STRING" : "TRIGGER"   ,   "PRIORITY" : "MANDATORY"  },
		{  "TO_STRING" : "SPACE"   ,   "PRIORITY" : "MANDATORY"  },
		{  "TO_STRING" : "SPACE"   ,   "PRIORITY" : "MANDATORY"  },
		{  "TO_STRING" : "SPACE"   ,   "PRIORITY" : "MANDATORY"  },
	]
}













var EXPENDABLE_SPACE_SOURCE = {
	"SELF"  :  Effect_Space_Source_Self
}


var EXPENDABLE_SPACE_MEDIUM = {
	"LINEA"       : {  "TYPE" : "DIRECTIONAL"  ,  "API" : Effect_Space_Medium_Linea   ,  "GETTER" : _010_linea      },
	"SELECT"      : {  "TYPE" : "INSTANT"      ,  "API" : Effect_Space_Medium_Select  ,  "GETTER" : _010_select     },
	"AREA"        : {  "TYPE" : "INSTANT"      ,  "API" : Effect_Space_Medium_Area    ,  "GETTER" : _010_area       },
	"UNIVERSAL"   : {  "TYPE" : "INSTANT"      ,  "API" : Effect_Space_Medium_Linea   ,  "GETTER" : _010_universal  }
}


var EXPENDABLE_TRIGGER_SPECIFIC = {
	 "BASE"           : Effect_Trigger_Specific_Base
	,"HAS_STAT"       : Effect_Trigger_Specific_Has_StatMod
	,"HAS_TEXTURE"	  : Effect_Trigger_Specific_Has_Texture
	,"IS_DOOR"        : Effect_Trigger_Specific_Is_Door     
	,"HAS_FLAG"       : Effect_Trigger_Specific_Has_Flag   
	,"HAS_CONDITION"  : Effect_Trigger_Specific_Has_Condition
}



var SLOT_KEYS   = [ "TIME"     , "TRIGGER"   , "SPACE"  , "EFFECT" ]
var UNIT_KEYS   = [ "SPAWN"    , "ONSET"     , "HIT"    , "OFFSET" ]


var ENTRIES = {
	"SPACE"   : {   "SOURCE"    : EXPENDABLE_SPACE_SOURCE
				   ,"MEDIUM"    : EXPENDABLE_SPACE_MEDIUM
				},


	"TRIGGER" : {   "SPECIFIC"  : EXPENDABLE_TRIGGER_SPECIFIC  
				   ,"BASE"      : [   "ALL" , "TILE_ACTOR" , "INTERACT_TILE" , "INTERACT_ACTOR" , "TILE" , "ACTOR" , "INTERACT"   ]   
				},


	"EVENT"   : {   "CONDITION" : _Syntax_Effect_Condition.EFFECT_CONDITION
				   ,"STAT_MOD"  : _Syntax_Effect_Statmod.EFFECT_UNIQUE_STATMOD   },
	}



	

func convertAndCheck(toCheck,inCheck): return inCheck.has(toCheck)


func HAS_TRIGGER_BASE(string):     	return convertAndCheck(string,ENTRIES.TRIGGER.BASE)
func HAS_TRIGGER_SPECIFIC(string): 	return convertAndCheck(string,ENTRIES.TRIGGER.SPECIFIC)

func HAS_SPACE_SOURCE(string): 		return convertAndCheck(string,ENTRIES.SPACE.SOURCE)
func HAS_SPACE_MEDIUM(string): 		return convertAndCheck(string,ENTRIES.SPACE.MEDIUM)

func HAS_EVENT_CONDITION(string):	return convertAndCheck(string,ENTRIES.EVENT.CONDITION)
func HAS_EVENT_STAT_MOD(string):	return convertAndCheck(string,ENTRIES.SPACE.STAT_MOD)
