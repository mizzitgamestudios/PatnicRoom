extends Node
class_name _00_01_CompIndex
const index = {

################################################################################
##  --- Actors ---                                                            ##
################################################################################
    "Comp_Actor_AllLimits" : Comp_Actor_AllLimits,
    #"Comp_Actor_Anatomy" : Comp_Actor_Anatomy,
    "Comp_Actor_Attributes" : Comp_Actor_Attributes,
    "Comp_Actor_Carriage": Comp_Actor_Carriage,
    "Comp_Actor_Condition": Comp_Actor_Condition,
    "Comp_Actor_Paintollerance" : Comp_Actor_Paintollerance,
    "Comp_Actor_Perk":Comp_Actor_Perk,
    "Comp_Actor_RaceName":Comp_Actor_RaceName,
    "Comp_Actor_RacialEnemies":Comp_Actor_RacialEnemies,
    "Comp_Actor_RacialFriends":Comp_Actor_RacialFriends,
    "Comp_Actor_RoleName":Comp_Actor_RoleName,
    "Comp_Actor_SpecialtyDescription":Comp_Actor_SpecialtyDescription,
    "Comp_Actor_SpecialtyName":Comp_Actor_SpecialtyName,
    "Comp_NPC_SkillBlock":Comp_NPC_SkillBlock,

    "Comp_Bodyparts_ArrayOfBodyParts":Comp_Bodyparts_ArrayOfBodyParts,
    "Comp_Bodyparts_Connects":Comp_Bodyparts_Connects,
    "Comp_Bodyparts_HitProbabillity": Comp_Bodyparts_HitProbabillity,

################################################################################
##  --- NPC ---                                                               ##
################################################################################
	
	"Comp_NPC_AttributeMod":Comp_NPC_AttributeMod,
	"Comp_NPC_Gear":Comp_NPC_Gear,
	"Comp_NPC_IndirectStats":Comp_NPC_IndirectStats,
	"Comp_NPC_Kit":Comp_NPC_Kit,
	"Comp_NPC_RoleDescription":Comp_NPC_RoleDescription,
	"Comp_NPC_Synonym":Comp_NPC_Synonym,
	"Comp_NPC_TileName":Comp_NPC_TileName,
	
	"Comp_Universal_Description":Comp_Universal_Description,
	"Comp_Universal_HitPoints":Comp_Universal_HitPoints,
	"Comp_Universal_Name":Comp_Universal_Name,
}

static func getIndex():
	return index
