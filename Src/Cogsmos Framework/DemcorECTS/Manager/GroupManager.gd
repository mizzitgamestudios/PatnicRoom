extends Node
class_name GroupManager

#FUNC itterates to the master atlas and looks for an entry that matches Parameter 
func lookUpEntity(searchedTerm:String):
	var allGroupsKeys = allGroups.keys()
	for i in allGroups.size():
		
		var currentGroup = allGroups[allGroupsKeys[i]].entitiesInGroup
		var currentGroupKeys = currentGroup.keys()
		
		for j in currentGroup.size():
			
			var currentEntry = currentGroupKeys[j]

			if currentEntry == searchedTerm:
				return currentGroup[currentGroupKeys[j]]


				
#----- ALL GROUPS ------------------------------------------------------------##

#FUNC groups are in order to sort diffrent types of Entities by theyr usage 
func initGroups():
	allInteractableEntities = Group_Atlas.new("atlas_AllInteractableEntities")
	allTileEntities			= Group_Atlas.new("atlas_AllTileEntities")
	# --- Misc Atlas --- #
	atlas_Items 			= Group_Atlas.new("atlas_Items")
	atlas_Races 			= Group_Atlas.new("atlas_Races")
	atlas_Anatomies 		= Group_Atlas.new("atlas_Anatomies")
	atlas_Roles 			= Group_Atlas.new("atlas_Roles")
	atlas_Specialties 		= Group_Atlas.new("atlas_Specialties")
	atlas_Bodyparts 		= Group_Atlas.new("atlas_Bodyparts")
	atlas_Factions 			= Group_Atlas.new("atlas_Factions")
	atlas_Flags 			= Group_Atlas.new("atlas_Flags")
	atlas_Consumables 		= Group_Atlas.new("atlas_Consumables")
	atlas_Tools 			= Group_Atlas.new("atlas_Tools")

	# --- Kit Matrix --- #
	atlas_Drones_Chassis 	= Group_Atlas.new("atlas_Drones_Chassis")
	atlas_Drones_Mod 		= Group_Atlas.new("atlas_Drones_Mod")

	atlas_Cyberware_Model 	= Group_Atlas.new("atlas_Cyberware_Model")
	atlas_Cyberware_Mod 	= Group_Atlas.new("atlas_Cyberware_Mod")
	
	atlas_Hacks_Codebase 	= Group_Atlas.new("atlas_Hacks_Codebase")
	atlas_Hacks_Mod 		= Group_Atlas.new("atlas_Hacks_Mod")
	
	# --- Kit Magic --- #
	atlas_Rite_Sacrifice 	= Group_Atlas.new("atlas_Rite_Sacrifice")
	atlas_Rite_Mod 			= Group_Atlas.new("atlas_Rite_Mod")
	
	atlas_Infusion_Tattoo 	= Group_Atlas.new("atlas_Infusion_Tattoo")
	atlas_Infusion_Mod 		= Group_Atlas.new("atlas_Infusion_Mod")
	
	atlas_Spell_Form 		= Group_Atlas.new("atlas_Spell_Form")
	atlas_Spell_Mod 		= Group_Atlas.new("atlas_Spell_Mod")
	
	# --- Kit Meat --- #
	atlas_Armor_Backslot 	= Group_Atlas.new("atlas_Armor_Backslot")
	atlas_Armor_Mod 		= Group_Atlas.new("atlas_Armor_Mod")

	atlas_Gun_Frame 		= Group_Atlas.new("atlas_Gun_Frame")
	atlas_Gun_Mod 			= Group_Atlas.new("atlas_Gun_Mod")
	
	atlas_Meele_Type 		= Group_Atlas.new("atlas_Meele_Type")
	atlas_Meele_Mod 		= Group_Atlas.new("atlas_Meele_Mod")
	
	# --- Kit Appendix --- #
	atlas_Matrix_Appendix = Group_Atlas.new("atlas_Matrix_Appendix")
	atlas_Magic_Appendix = Group_Atlas.new("atlas_Magic_Appendix")
	atlas_Meat_Appendix = Group_Atlas.new("atlas_Meat_Appendix")
	



var allTileEntities
var allInteractableEntities

var allGroups={}
var atlas_All_Kit_Parts = {}
var group_actorsOnMap 

var atlas_Items
var atlas_Races
var atlas_Anatomies
var atlas_Roles
var atlas_Specialties
var atlas_Consumables
var atlas_Bodyparts

var atlas_Factions
var atlas_Flags
var atlas_Tools


# --- KIT MATRIX --- #
var atlas_Drones_Chassis
var atlas_Drones_Mod

var atlas_Cyberware_Model
var atlas_Cyberware_Mod

var atlas_Hacks_Codebase
var atlas_Hacks_Mod

# --- KIT MAGIC --- #
var atlas_Spell_Form
var atlas_Spell_Mod

var atlas_Infusion_Tattoo
var atlas_Infusion_Mod

var atlas_Rite_Sacrifice
var atlas_Rite_Mod

# --- KIT MEAT --- #
var atlas_Meele_Type
var atlas_Meele_Mod

var atlas_Gun_Frame
var atlas_Gun_Mod

var atlas_Armor_Backslot
var atlas_Armor_Mod

# ---KIT APPENDIX ---#
var atlas_Matrix_Appendix
var atlas_Meat_Appendix
var atlas_Magic_Appendix






