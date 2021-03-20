 extends Node



var ATLAS_COMP_INDEX = {}
var CLASSES_ARRAY
var INDEX_ARRAY

func _init() -> void:
	CLASSES_ARRAY = ATLAS_INDEX_COMP.values()
	INDEX_ARRAY   = ATLAS_INDEX_COMP.keys()

	for i in ATLAS_INDEX_COMP.size():
		ATLAS_COMP_INDEX[CLASSES_ARRAY[i]] = INDEX_ARRAY[i]


func GET_BOTH(searchName:String, debugPara=false):
	if   ATLAS_INDEX_COMP.has(searchName):    return ATLAS_INDEX_COMP[searchName]
	elif ATLAS_FLAGS.has(searchName):         return ATLAS_FLAGS[searchName]
	elif debugPara:                           print("Compnent with name: "+searchName+" not found"); return null
	
func GET_COMPONENT(componentName:String, debugPara=false):
	if ATLAS_INDEX_COMP.has(componentName): return ATLAS_INDEX_COMP[componentName]
	elif debugPara:                         print("Compnent with name: "+componentName+" not found"); return null

func GET_FLAG(flagName:String, debugPara=false):
	if   ATLAS_FLAGS.has(flagName):         return ATLAS_FLAGS.get(flagName)
	elif debugPara:                         return print("flag with name: "+flagName+" not found")
	else:                                   return null



var ATLAS_INDEX_COMP ={
	"C_0_ANY_DESCRIPTION"					:	C_0_ANY_DESCRIPTION,
	"C_1_ANY_IS_WALKABLE"		:	C_1_ANY_IS_WALKABLE,
	"C_2_ANY_TEXTURE_ID"        			: 	C_2_ANY_TEXTURE_ID,
	"C_3_ANY_LAYER"             			: 	C_3_ANY_LAYER,
	"C_4_ANY_MAGIC_NOISE"       			: 	C_4_ANY_MAGIC_NOISE,
	"C_5_ANY_MATRIX_NOISE"      			: 	C_5_ANY_MATRIX_NOISE,
	"C_6_TILE_NAME"         				: 	C_6_TILE_NAME,
	"C_7_TILE_STATIC_TILESET_NR" 			:	C_7_TILE_STATIC_TILESET_NR,
	"C_10_ACTOR_PERKS"             			:   C_10_ACTOR_PERKS,
	"C_11_ACTOR_RACE_NAME"        	 		:   C_11_ACTOR_RACE_NAME,
	"C_50_ACTOR_ROLE_DESCRIPTION"  			: 	C_50_ACTOR_ROLE_DESCRIPTION,
	"C_13_ACTOR_ROLE_NAME"					:	C_13_ACTOR_ROLE_NAME,
	"C_14_ACTOR_SPECIALTY_NAME"  			: 	C_14_ACTOR_SPECIALTY_NAME,
	"C_15_ACTOR_ARRAY_BODYPARTS"   			:	C_15_ACTOR_ARRAY_BODYPARTS,
	"C_16_ACTOR_BODYPARTS_CONNECTS"			: 	C_16_ACTOR_BODYPARTS_CONNECTS,
	"C_17_ACTOR_BODYPARTS_HITPROBABILLITY"	:   C_17_ACTOR_BODYPARTS_HITPROBABILLITY,
	"C_18_ACTOR_ATTRIBUTEMOD" 				:   C_18_ACTOR_ATTRIBUTEMOD,
	"C_19_ACTOR_ATTRIBUTES"  				: 	C_19_ACTOR_ATTRIBUTES,
	"C_20_ACTOR_SKILLBLOCK"     			: 	C_20_ACTOR_SKILLBLOCK,
	"C_21_TILE_TILENAME" 					:   C_21_TILE_TILENAME,
	"C_22_ACTOR_LIMITS"     				:   C_22_ACTOR_LIMITS,
	"C_23_ACTOR_CARRIAGE"     				: 	C_23_ACTOR_CARRIAGE,
	"C_26_ACTOR_INDIRECT_STATS" 			:	C_26_ACTOR_INDIRECT_STATS,
	"C_27_ACTOR_RACIAL_ENEMIES" 			: 	C_27_ACTOR_RACIAL_ENEMIES,
	"C_28_ACTOR_RACIAL_FRIENDS"    			:   C_28_ACTOR_RACIAL_FRIENDS,
	"C_29_ANY_LISTING_PRICE"  				:   C_29_ANY_LISTING_PRICE,
	"C_30_ANY_NEEDED_BACKPACK_SLOTS"   		:   C_30_ANY_NEEDED_BACKPACK_SLOTS,
	"C_31_KIT_CAT_TYPE"						:   C_31_KIT_CAT_TYPE,
	"C_32_ANY_LIST_OF_CONDITIONS"  			: 	C_32_ANY_LIST_OF_CONDITIONS,
	"C_33_KIT_COOLDOWN_TIMER"   			: 	C_33_KIT_COOLDOWN_TIMER,
	"C_34_ANY_LOG_TO_STRING"  				:   C_34_ANY_LOG_TO_STRING,
	"C_35_KIT_MECHANICAL_SUMMARY"			:   C_35_KIT_MECHANICAL_SUMMARY,
	"C_36_KIT_MOD_TIME"        				: 	C_36_KIT_MOD_TIME,
	"C_37_ANY_M_TYPE"            			:	C_37_ANY_M_TYPE,
	"C_38_KIT_PART_TYPE"		    		: 	C_38_KIT_PART_TYPE,
	"C_40_ANY_TO_STRING"       				: 	C_40_ANY_TO_STRING,
	"C_42_ROLE_VARIETY"						:	C_42_ROLE_VARIETY,
	"C_43_PLAYER_DESCRIPTION"				:	C_43_PLAYER_DESCRIPTION,
	"C_44_PLAYER_STREETNAME"				: 	C_44_PLAYER_STREETNAME,
	"C_45_PLAYER_NAME" 						:   C_45_PLAYER_NAME,
	"C_47_ANY_SYNONYM"						:	C_47_ANY_SYNONYM,
	"C_48_ANY_RARITY"						:	C_48_ANY_RARITY,
	"C_49_EFFECT_REFERENCE"					:	C_49_EFFECT_REFERENCE,
	"C_54_ANY_ENTITY_TYPE"					:	C_54_ANY_ENTITY_TYPE,
	"C_51_PLAYER_KITSETS" 					: 	C_51_PLAYER_KITSETS,
	"C_56_BASE_CONNECTOR"					:	C_56_BASE_CONNECTOR,
	"C_58_ALTERNATIVE_TEXTURES"             :   C_58_ALTERNATIVE_TEXTURES,
	"C_59_KIT_MOD_CHANGE"                   :   C_59_KIT_MOD_CHANGE,
	"C_60_BASE_KIT_REFERENCE"              : C_60_BASE_KIT_REFERENCE,
	"C_8_STRUCTURE_HP"                     : C_8_STRUCTURE_HP,
	"C_9_CREDITS_ACCOUNT"                 : C_9_CREDITS_ACCOUNT,
	"C_61_LOOT_TABLE" : C_61_LOOT_TABLE,
	"C_62_LOOT_STATE":C_62_LOOT_STATE
}

var ATLAS_FLAGS ={
	"F_1_STATIC_INTERACTABLE_TYPE" 		    :	1,
	"F_2_TILE_TYPE" 					    :   2,
	"F_3_ITEM" 					            :   3,
	"F_4_PLAYER_TYPE" 					    :   4,
	"F_5_KITPART_TYPE"					    :   5,
	"F_6_ACTOR_ATTRIBUTES"				    :   6,
	"F_7_ACTOR_ATTRIBUTES_SPECIALTY"	    :   7,
	"F_8_IS_WALL"							:   8,
	"F_9_IS_DOOR"							:   9,
	"F_10_ACTOR_ATTRIBUTES_ROLES"           :  10,
	"F_11_ACTOR_ATTRIBUTES_RACE"            :  11,
	"F_12_LOOT_SOURCE_TYPE"                      : 12
}
