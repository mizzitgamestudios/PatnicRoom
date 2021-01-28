extends Node
class_name GroupManager

################################################################################
##  --- Variables ---                                                         ##
################################################################################
# systems in a group
var group_systems = {};

# a group represents a collection of systems
var groups = {};



################################################################################
##  --- Management ---                                                        ##
################################################################################

func addGgroup(group:Group):
	DemokrECTS.performanceManager.is_dirty = true;
	var groupName: String = group.name.to_lower();
	if isGroupInECS(groupName):
		return;
	groups[groupName] = group;

func isGroupInECS(group_name) -> bool:
	if groups.has(group_name):
		return true
	return false



################################################################################
##  --- List Of Groups---                                                     ##
################################################################################

##################
# --- COMMON --- #
##################
var allGroups
# --- Atlas ---
var atlas_Items
var atlas_Races
var atlas_Anatomies
var atlas_Roles
var atlas_Specialties
var atlas_Consumables
var atlas_Bodyparts


###############
# --- KIT --- #
###############
# --- MATRIX --- #
var atlas_Drones_Chassis
var atlas_Drones_Mod

var atlas_Cyberware_Model
var atlas_Cyberware_Mod

var atlas_Hacks_Codebase
var atlas_Hacks_Mod

var atlas_Matrix_Appendix

# --- MAGIC --- #
var atlas_Spell_Form
var atlas_Spell_Mod

var atlas_Infusion_Tattoo
var atlas_Infusion_Mod

var atlas_Rite_Sacrifice
var atlas_Rite_Mod

var atlas_Magic_Appendix

# --- MEAT --- #
var atlas_Meele_Type
var atlas_Meele_Mod

var atlas_Gun_Frame
var atlas_Gun_Mod

var atlas_Armor_Backslot
var atlas_Armor_Mod

var atlas_Meat_Appendix


####################
# --- REALTIME --- #
####################
var group_actorsOnMap 




func initGroups():
	#Atlas
	atlas_Items = Group_Atlas.new("atlas_Items")
	atlas_Races = Group_Atlas.new("atlas_Races")
	atlas_Anatomies = Group_Atlas.new("atlas_Anatomies")
	atlas_Roles = Group_Atlas.new("atlas_Roles")

	atlas_Specialties = Group_Atlas.new("atlas_Specialties")
	atlas_Bodyparts = Group_Atlas.new("atlas_Bodyparts")
	#Kit Atlas
	atlas_Drones_Chassis = Group_Atlas.new("atlas_Drones_Chassis")
	atlas_Cyberware_Model = Group_Atlas.new("atlas_Cyberware_Model")
	atlas_Hacks_Codebase = Group_Atlas.new("atlas_Hacks_Codebase")
	atlas_Infusion_Mod = Group_Atlas.new("atlas_Infusion_Mod")
	atlas_Rite_Mod = Group_Atlas.new("atlas_Rite_Mod")
	atlas_Magic_Appendix = Group_Atlas.new("atlas_Magic_Appendix")
	atlas_Meele_Mod = Group_Atlas.new("atlas_Meele_Mod")
	atlas_Gun_Mod = Group_Atlas.new("atlas_Gun_Mod")
	atlas_Meat_Appendix = Group_Atlas.new("atlas_Meat_Appendix")
	atlas_Hacks_Mod = Group_Atlas.new("atlas_Hacks_Mod")
	atlas_Spell_Mod = Group_Atlas.new("atlas_Spell_Mod")
	atlas_Spell_Form = Group_Atlas.new("atlas_Spell_Form")
	atlas_Infusion_Tattoo = Group_Atlas.new("atlas_Infusion_Tattoo")
	atlas_Rite_Sacrifice = Group_Atlas.new("atlas_Rite_Sacrifice")
	atlas_Matrix_Appendix = Group_Atlas.new("atlas_Matrix_Appendix")
	atlas_Cyberware_Mod = Group_Atlas.new("atlas_Cyberware_Mod")
	atlas_Drones_Mod = Group_Atlas.new("atlas_Drones_Mod")
	
	atlas_Meele_Type = Group_Atlas.new("atlas_Meele_Type")
	atlas_Gun_Frame = Group_Atlas.new("atlas_Gun_Frame")
	atlas_Armor_Backslot = Group_Atlas.new("atlas_Armor_Backslot")
	#Realtime
	group_actorsOnMap = Group_ActorsOnMap.new("group_actorsOnMap")

