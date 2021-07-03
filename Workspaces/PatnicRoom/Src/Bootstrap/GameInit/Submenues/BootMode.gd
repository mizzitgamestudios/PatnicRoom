extends Node



func _on_tilemap_details_pressed() -> void:
	get_node("detail").visible = true
	get_node("detail/RichTextLabel3").bbcode_text = "insert your Tiled! JSON into the Config-folder by the name \"experimental_tilemap.json\""


func _on_quickstart_details_pressed() -> void:
	get_node("detail").visible = true
	get_node("detail/RichTextLabel3").bbcode_text = "insert your Tiled! JSON into the Config-folder by the name \"experimental_tilemap.json\""





func _on_Restmode_pressed() -> void:
	OS.window_fullscreen = !OS.window_fullscreen
	GameInit.runRestmode()


func _on_Quickstart_pressed() -> void:
	OS.window_fullscreen = !OS.window_fullscreen
	GameInit.runQuickStart()


func _on_Statistics_pressed() -> void:
	OS.window_fullscreen = !OS.window_fullscreen
	GameInit.runStatistics()


func _on_Tilemap_pressed() -> void:
	OS.window_fullscreen = !OS.window_fullscreen
	GameInit.runTilemapTest()

<<<<<<< HEAD



func _on_Experimental_pressed() -> void:
	OS.window_fullscreen = !OS.window_fullscreen
	GameInit.runQuickStart()
	
	var cache:PlayerEntity = API_006_Player.currentChar
	var arr = ["C_S_2","C_S_1","C_S_1__M_1","C_S_1__M_2","C_S_2__M_1","C_S_3__M_1","C_S_3__M_2"]
	
	for i in arr:
		cache.kitventory.appendKitventory(i)
	
	
	
	
	
	
	
	
	
	





=======
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
