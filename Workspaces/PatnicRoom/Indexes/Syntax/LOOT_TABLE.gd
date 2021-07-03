extends Node
class_name LootTable_Syntax



var ENTRIES = {
	"LOOT"          : {   "CONSUMABLE"   : [   "LOOT_TYPE" , "CHANCE" , LOOT_AMMOUNT   ,   "LISTINGS"     ],  
						   "CREDITS"     : [   "LOOT_TYPE" , "CHANCE" , LOOT_AMMOUNT                      ],
						   "KIT_PART"    : [   "LOOT_TYPE" , "CHANCE" , LOOT_AMMOUNT                      ]   },


	"EVENT"         : {   "CONSTRUCTOR"  : [   [] , EVENT_CHECK , EVENT_LOG   ],  
						  "CHECK"        : EVENT_CHECK,
						  "LOG"          : [   "LOG_SUCCES" , "LOG_FAILURE"                            ]   },
	
	
	"EFFECT_REF_NR" : []
}  




var LOOT_AMMOUNT = {"AMMOUNT" : [   "HARD_WIRED" , "SIMPLE_RANDOM" , "COMPLEX_RANDOM"   ]}

var EVENT_CHECK  = {"CHECK"   : [   ENUM.PLAYER.SKILL , "THRASH_HOLD"  ]}
var EVENT_LOG    = {"LOG"     : [   "LOG_SUCCES" , "LOG_FAILURE"  ]}






var MODULE_CHECK   = [ ENUM.PLAYER.SKILL                , "THRASH_HOLD"          , "LOG_SUCCES"     , "LOG_FAILURE" ]
var MODULE_AMOUNT  = [ "HARD_WIRED"              , "SIMPLE_RANDOM"        , "COMPLEX_RANDOM"                 ]

