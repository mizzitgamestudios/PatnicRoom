
# CLASS  Variables instead of Functions to call dictOfComps because those are        
# CLASS rarely altered and not ducktyped                                             
# DOCS 	                                                                             
# CLASS                                                                              
extends Entity
class_name KitPartEntity



var effect: EffectEntity



# ----- COMMON VARS ---------------------------------------------------------- ##


# VAR GENERALL     
func name() 				-> String: 			return getCompValue(C_6_TILE_NAME.name_quack())
func decription()   		-> String:			return getCompValue(C_0_ANY_DESCRIPTION.name_quack())
func toString()   		    -> String:			return getCompValue(C_40_ANY_TO_STRING.name_quack())
func mechanicalSummary()    -> String:			return getCompValue(C_35_KIT_MECHANICAL_SUMMARY.name_quack())#

# VAR TYPES        
func mType()      			-> String: 			return getCompValue(C_37_ANY_M_TYPE.name_quack())
func catType()   		    -> String:			return getCompValue(C_31_KIT_CAT_TYPE.name_quack())
func partType()        		-> int:				return getCompValue(C_38_KIT_PART_TYPE.name_quack())

# VAR TIMERS       
func modTime()           	-> String: 			return getCompValue(C_36_KIT_MOD_TIME.name_quack())
func cooldownTime()     	-> bool: 			return getCompValue(C_33_KIT_COOLDOWN_TIMER.name_quack())

# VAR USAGE        
func rarity()    			-> String:			return getCompValue(C_48_ANY_RARITY.name_quack())
<<<<<<< HEAD
func effectReference()      -> EffectEntity:			return getCompValue(C_49_EFFECT_REFERENCE.name_quack())
=======
func effectReference()      -> String:			return getCompValue(C_49_EFFECT_REFERENCE.name_quack())
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684







func getNameForGroupEntry():
	if has(C_6_TILE_NAME.name_quack()):
		return getCompValue(C_6_TILE_NAME)
	else:
		return name()

