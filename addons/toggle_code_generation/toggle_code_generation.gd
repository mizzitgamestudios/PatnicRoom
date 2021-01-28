tool
extends EditorPlugin

var editor_node : Node
var script_editor : ScriptEditor

var menu : PopupMenu
var option : Resource

const OPTION_SAVE_PATH = "res://addons/toggle_code_generation/option.tres"

func _enter_tree():	
	
	# hook
	
	editor_node = get_editor_interface().get_base_control().get_parent().get_parent()
	script_editor = get_editor_interface().get_script_editor()
	
	editor_node.disconnect("script_add_function_request", script_editor, "_add_callback")
	
	# handler
	
	editor_node.connect("script_add_function_request", self, "handle_add_function_request")
	
	if ResourceLoader.exists(OPTION_SAVE_PATH):
		option = ResourceLoader.load(OPTION_SAVE_PATH)
	else:
		option = Resource.new()
	
	menu = PopupMenu.new()
	menu.hide_on_checkable_item_selection = false
	menu.connect("index_pressed", self, "_menu_idx_pressed")
	
	_add_menu_option("GDScript")
	_add_menu_option("CSharpScript") # other languages don't need this yet.
	menu.add_separator()
	_add_menu_option("Copy Function Name")
	
	add_tool_submenu_item("Toggle Code Generation", menu)


func _exit_tree():
	
	# restore
	editor_node.connect("script_add_function_request", script_editor, "_add_callback")
	
	editor_node.disconnect("script_add_function_request", self, "handle_add_function_request")
	remove_tool_menu_item("Toggle Code Generation")


func handle_add_function_request(obj : Object, function, args):
	var lang = obj.get_script().get_class()
	if _get_option(lang):
		script_editor.call("_add_callback", obj, function, args)
	
	if _get_option("Copy Function Name"):
		OS.clipboard = function
		print_debug("Copy ", function, " to clipboard.")


func _menu_idx_pressed(idx):
	menu.toggle_item_checked(idx)
	var key = menu.get_item_text(idx)
	option.set_meta(key, menu.is_item_checked(idx))
	ResourceSaver.save(OPTION_SAVE_PATH, option)


func _add_menu_option(name):
	menu.add_check_item(name)
	menu.set_item_checked(menu.get_item_count()-1, _get_option(name))


func _get_option(name, default = false):
	if option.has_meta(name):
		return option.get_meta(name)
	return default
