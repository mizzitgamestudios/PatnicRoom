extends Node
class_name _02_00_CompIndex
const index = {

################################################################################
##  --- Culture ---                                                           ##
################################################################################
	
"Comp_Items_BackpackSlotsNeeded":Comp_Items_BackpackSlotsNeeded,
"Comp_Items_ListingPrice":Comp_Items_ListingPrice,

################################################################################
##  --- KitPart ---                                                            ##
################################################################################
"Comp_KitPart_CooldownTime": Comp_KitPart_CooldownTime,
"Comp_KitPart_LogToString":Comp_KitPart_LogToString,
"Comp_KitPart_MType":Comp_KitPart_MType,
"Comp_KitPart_MechanicalSummary":Comp_KitPart_MechanicalSummary,
"Comp_KitPart_ModTime":Comp_KitPart_ModTime,
"Comp_KitPart_StrategyKeywords":Comp_KitPart_StrategyKeywords,
"Comp_KitPart_EffectReference":Comp_KitPart_EffectReference,

################################################################################
##  --- Culture ---                                                           ##
################################################################################
"Comp_Kit_KitCat":Comp_Kit_KitCat,
"Comp_Kit_KitType":Comp_Kit_KitType,

"Comp_Kit_baseConnection":Comp_Kit_baseConnection,
"Comp_Kit_modConnection":Comp_Kit_modConnection,
"Comp_Kit_appendixConnection":Comp_Kit_appendixConnection,



################################################################################
##  --- KitSet ---                                                            ##
################################################################################
"Comp_Kit_LogToString":Comp_Kit_LogToString,
"Comp_Kit_SymbiosType":Comp_Kit_SymbiosType,
}

static func getIndex():
	return index
