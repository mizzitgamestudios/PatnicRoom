###############################################################################################################################
#                                                                                                                             #
# Klasse:		--- DemokrECTS ---                                                                                            #
# description:	increases Framerate and empties unused but reserved memory space                                              #
#                                                                                                                             #
# data flow:	SokraTiles -> PanicMode -> Actor Layor                                                                        #
# often called:	N/A                                                                                                           #
#                                                                                                                             #
###############################################################################################################################

extends Node


var atlas_component_entities = {};
var atlas_entities = {}
var atlas_systems = {}
var component_Index = {}
var groupManager :GroupManager



func get_All_Kit_Part_Entities():
	return groupManager.atlas_All_Kit_Parts

# use ENUM.ATLAS_GROUP.__________
func get_Group_By_Name(namePara:String):
	if namePara.begins_with("atlas_"):
		return groupManager.allGroups[str("atlas_"+namePara)]
	else:
		return groupManager.allGroups[namePara]
	


func get_array_of_all_entites_with_comp(string_of_comp:String):
	var _entities_with_comp: Dictionary = atlas_component_entities[string_of_comp]
	return _entities_with_comp.keys()

func synch_Component_Index(component_Index_Para:Dictionary):
	var keys_of_dictionary = component_Index_Para.keys()
	var values_of_dictionary = component_Index_Para.values()

	for i in keys_of_dictionary.size():
		component_Index[keys_of_dictionary[i]] = values_of_dictionary[i]
