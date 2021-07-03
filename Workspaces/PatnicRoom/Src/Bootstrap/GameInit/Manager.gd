extends Node




var currentOptionForm
var startConfig := ConfigFile.new();



func _on_options_pressed() -> void:
	get_node("optionsPanel").visible = true;
	get_node("options").visible = false
	get_node("RichTextLabel").visible = false


func _on_kitsToStart_pressed() -> void:
	removeOtherOptionIfNeccessary()
	addScene("res://Src/Bootstrap/GameInit/Submenues/StartingKits.tscn")
	
func _on_bootMode_pressed() -> void:
	removeOtherOptionIfNeccessary()
	addScene("res://Src/Bootstrap/GameInit/Submenues/BootMode.tscn")
	
func _on_communityContent_pressed() -> void:
	removeOtherOptionIfNeccessary()
	addScene("res://Src/Bootstrap/GameInit/Submenues/ContentManager.tscn")
	
func _on_Event_pressed() -> void:
	removeOtherOptionIfNeccessary()
	addScene("res://Src/Bootstrap/GameInit/Submenues/Event.tscn")
	



func removeOtherOptionIfNeccessary():
	if is_instance_valid(currentOptionForm):
		get_node("optionsPanel/form").remove_child(currentOptionForm)
		currentOptionForm = null

func addScene(filepath:String):
	var loadedScene = load(filepath)
	currentOptionForm = loadedScene.instance()
	get_node("optionsPanel/form").add_child(currentOptionForm)






func _on_default_pressed() -> void:
	OS.window_fullscreen = !OS.window_fullscreen
	Gameloop.startTitleMode()





