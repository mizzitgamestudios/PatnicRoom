extends Object
class_name KitPartEntity



################################################################################
##  --- Variables ---                                                         ##
################################################################################
var name: Comp_Universal_Name
var decription: Comp_Universal_Description
var toString: Comp_KitPart_ToString
var mechanicalSummary: Comp_KitPart_MechanicalSummary


var mType:Comp_KitPart_MType
var catType:Comp_KitPart_CatType
var partType:Comp_KitPart_PartType

var modTime: Comp_KitPart_ModTime
var cooldownTime: Comp_KitPart_CooldownTime

var rarity: Comp_Universall_Rarity
var effectReference: Comp_KitPart_EffectReference
var strategyKeyword: Comp_KitPart_StrategyKeywords


var effect: EffectEntity

func construct(ent:Entity) -> void:
	name = ent.getComponent("Comp_Universal_Name")
	decription = ent.getComponent("Comp_Universal_Description")
	toString = ent.getComponent("Comp_KitPart_ToString")
	mechanicalSummary = ent.getComponent("Comp_KitPart_MechanicalSummary")
	mType = ent.getComponent("Comp_KitPart_MType")
	catType = ent.getComponent("Comp_KitPart_CatType")
	partType = ent.getComponent("Comp_KitPart_PartType")
	modTime = ent.getComponent("Comp_KitPart_ModTime")
	cooldownTime = ent.getComponent("Comp_KitPart_CooldownTime")
	rarity = ent.getComponent("Comp_Universall_Rarity")
	effectReference = ent.getComponent("Comp_KitPart_EffectReference")
	strategyKeyword = ent.getComponent("Comp_KitPart_StrategyKeywords")

	





