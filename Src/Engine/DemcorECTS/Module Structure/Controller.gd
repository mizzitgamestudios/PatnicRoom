###############################################################################################################################
#                                                                                                                             #
# Klasse:		Controller parent                                                                                             #
# description:	API for all Scripts of other Modules who want to access informations / functions of this Module               #                                                                                                                             #
# data flow:	                                                                                                              #
# often called: get_entity, get_template, connect_entity, disconnect_entity_and_delete, get_entities_by_comp                  #
# parent:       should only be used for defining module-specific child-controller                                             #
#                                                                                                                             #
###############################################################################################################################

extends Node
class_name DemocrECTS_Controller

########################
# --- Variables ------ #
########################
var _arra_entity : Array = []               # entities which are in this System in the moment
var _arra_template : Array = []             # template-entities which are in this module

var _dict_flag_index : Dictionary = {}      # Key is name of flag, value is Array of entities instanceID who 
var _dict_component_index : Dictionary = {} # Key is name of Component, value is the class itself



########################
# --- Init ----------- #
########################
func _init() -> void:
    # self.name = nameOfModule
    pass



########################
# --- Getter --------- #
########################
func get_entity(entity_instance_ID:int):
    return self._try_get_entry_of_array(_arra_entity,entity_instance_ID)

func get_template(template_instance_ID:int):
    return self._try_get_entry_of_array(_arra_template,template_instance_ID)

func get_entities_by_comp(string_of_comp:String):
    if !DemokrECTS.componentIndex.has(string_of_comp):
        _log_flag_not_found_exception(string_of_comp)
    else:

        var _entity_instanceID_list: Array = DemokrECTS.get_array_of_all_entites_with_comp(string_of_comp)
        var returnArray: Array = []

        for i in _entity_instanceID_list.size():
            var entity_instanceID :int = _entity_instanceID_list[i]

            if has_entity(entity_instanceID):
                returnArray.append( instance_from_id(entity_instanceID) )
    
        return returnArray


func entityAddedToModule(entity:Entity):
    _arra_entity.append(entity.get_instance_id())

func entityRemovedFromModule(entity:Entity):
    var index_Number_of_entity=_arra_entity.find(entity.get_instance_id())
    _arra_entity.remove(index_Number_of_entity)

########################
# --- Setter --------- #
########################
# entity is already added to ECS,use this to couple it to the Module
func conncet_entity_to_Controller(ent:Entity):
    var entInstID :int = ent.get_instance_id()

    if self._try_has_array_searched_entry(_arra_entity,entInstID):
        _log_entity_already_integrated_exception(_arra_entity,entInstID)
    else:
        _arra_entity.append(entInstID)

# also deletes it from ECS!
func disconnect_entity_and_delete(entity:Entity):
    var entity_instance_id :int = entity.get_instance_id()

    if self._try_can_entry_get_removed(_arra_entity,entity_instance_id):
        _log_entity_not_found_exception(_arra_entity,entity_instance_id)
    else:
        _arra_entity.remove(entity_instance_id)
        DemokrECTS.entityManager.remove_entity(entity)



########################
# --- Saniticer ------ #
########################
func has_entity(entity_instance_ID:int):
    return self._try_has_array_searched_entry(_arra_entity,entity_instance_ID)
    
func has_template(template_instance_ID:int):
    return self._try_has_array_searched_entry(_arra_template,template_instance_ID)




########################
# --- Exceptions ----- #
########################
func _try_has_array_searched_entry(array:Array,entry:int):
    var return_value: bool

    if -1 != array.find(entry):
        return_value = true
    else:
        return_value = false

    return return_value


func _try_get_entry_of_array(array:Array,entry:int):

    if _try_has_array_searched_entry(array,entry):
        return instance_from_id(entry)
    else:
        _log_entity_not_found_exception(array,entry)
        return 0


func _try_can_entry_get_removed(array:Array,entry:int):
    return !_try_has_array_searched_entry(array,entry)



########################
# --- Logger --------- #
########################
func _print_head_log_entry() -> void:
    print("----- EXCEPTION -----")
    print("in Module: "+self.name)
func _print_separator() -> void:
    print()
    print()


func _log_entity_not_found_exception(array:Array,entry:int) -> void:
    _print_head_log_entry()
    print(ENUM.EXCEPTION_TYPE["1"])

    print("entity with instance-ID "+str(entry)+" not found in "+str(array)) #TODO in Log sysmtem
    _print_separator()

func _log_entity_already_integrated_exception(array:Array,entry:int) -> void:
    _print_head_log_entry()
    print(ENUM.EXCEPTION_TYPE["2"])

    print("entity with instance-ID "+str(entry)+" is already in "+str(array)) #TODO in Log sysmtem
    _print_separator()

func _log_flag_not_found_exception(flag:String) -> void:
    _print_head_log_entry()
    print(ENUM.EXCEPTION_TYPE["1"])

    print("flag "+flag+" not found") #TODO in Log sysmtem
    _print_separator()







