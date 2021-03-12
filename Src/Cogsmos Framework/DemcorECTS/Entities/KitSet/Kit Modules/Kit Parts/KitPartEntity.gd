extends Entity
#//CLASS  Variables instead of Functions to call dictOfComps because those are 
#//CLASS rarely altered and not ducktyped                                      
class_name KitPartEntity


var effect: EffectEntity



func name() 				-> int: 			return getCompValue(C_6_TILE_NAME.name_quack())
func decription()   		-> int:				return getCompValue(C_0_ANY_DESCRIPTION.name_quack())
func toString()   		    -> String:			return getCompValue(C_40_ANY_TO_STRING.name_quack())
func mechanicalSummary()    -> int:				return getCompValue(C_35_KIT_MECHANICAL_SUMMARY.name_quack())
func mType()      			-> bool: 			return getCompValue(C_37_ANY_M_TYPE.name_quack())
func catType()   		    -> String:			return getCompValue(C_31_KIT_CAT_TYPE.name_quack())
func partType()        		-> String:			return getCompValue(C_38_KIT_PART_TYPE.name_quack())
func modTime()           	-> String: 			return getCompValue(C_36_KIT_MOD_TIME.name_quack())
func cooldownTime()     	-> bool: 			return getCompValue(C_33_KIT_COOLDOWN_TIMER.name_quack())
func rarity()    			-> String:			return getCompValue(C_48_ANY_RARITY.name_quack())
func effectReference()      -> String:			return getCompValue(C_49_EFFECT_REFERENCE.name_quack())
func strategyKeywoard()     -> String: 			return getCompValue(C_39_KIT_STRATEGY_KEYWORD.name_quack())






func getNameForGroupEntry():
	if has(C_6_TILE_NAME.name_quack()):
		return getCompValue(C_6_TILE_NAME)
	else:
		return name()

