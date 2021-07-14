extends Object
class_name NPC_Syntax






var ENTRIES = {

	"MANDATORY" : {    "SPECIALTY"   : [   "INDEX" , "FOCUSED_M_TYPE"            ,    "SOCIAL_HIRACHY" , "BEHAVIOUR" , "TIER"   ],  
					   "ROLE"        : [   "INDEX" , "FOCUSED_M_TYPE"            ,    "PREFERD_CHUNK"                           ],
					   "RACE"        : [   "INDEX" , "FOCUSED_M_TYPE"                                                           ]   },


	"OPTIONAL"  : {    "KITSETS"     : [   "INDEX" , "FOCUSED_M_TYPE" , "CAT"    ,    "STAT_MOD"   , "CONDITION" , "PART"       ],  
					   "ITEMS"       : [   "INDEX" , "FOCUSED_M_TYPE" , "CAT"    ,    "RESSOURCES" , "CREDITS"                  ],
					   "LOOT_TABLES" : [   "INDEX" ,                                                                            ],  
					   "TRAITS"      : [   "INDEX" ,                                                                            ]   }
}  







static func getSyntax():
	return {
	  "INDEX": [
		 "ROLE"
		,"SPECIALTY"
		,"RACE"
		,"KITSET"
		,"ITEM"
		,"LOOT_TABLE"
	  ],
	
	  
	  "ATLAS":{
		"ROLE"       : [ "FOCUSED_M_TYPE", "PREFERD_CHUNK_KEYWORD", "INDEX"                    ],
		"SPECIALTY"  : [ "SOCIAL_HIRACHY", "BEHAVIOUR", "TIER", "FOCUSED_M_TYPE", "INDEX"      ],
		"RACE"       : [ "INDEX", "PREFERD_CHUNK_KEYWORD"                                      ],
		"KITSET"     : [ "STATMOD" , "FOCUSED_M_TYPE" , "CAT" , "PART" , "CONDITION" , "INDEX" ],
		"ITEM"       : [ "CREDITS" , "INDEX" , "CAT" , "RESSOURCES"                            ],
		"LOOT_TABLE" : [ "INDEX"                                                               ]   
		}
	}
