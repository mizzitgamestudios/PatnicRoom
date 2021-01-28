extends Node

var zoneStyle
func _ready():
	zoneStyle=createZoneStyle()
	
	


func createZoneStyle():
	var style = StyleBoxFlat.new()
	
	style.bg_color ="#4b4b4b"
	style.border_color = "#cccccc"
	
	style.border_width_bottom = 3
	style.border_width_right = 3
	style.border_width_top = 3
	
	return style

func createInputStyleSleep():
	var style = StyleBoxFlat.new()
	
	style.bg_color ="#ffffff"
	style.border_color = "#000000"
	
	style.set_border_width_all(2)
	style.set_corner_radius_all(3)
	
	return style
	


func createInputStyleAwake():
	var style = StyleBoxFlat.new()
	
	style.bg_color ="#ffffff"
	style.border_color = "#b9b419"
	
	style.set_border_width_all(2)
	style.set_corner_radius_all(3)
	
	return style

func createInputStyleListening():
	var style = StyleBoxFlat.new()
	
	style.bg_color ="#ffffff"
	style.border_color = "#58eb43"
	
	style.set_border_width_all(2)
	style.set_corner_radius_all(3)
	
	return style

func createButtonStyleSleep():
	var style = StyleBoxFlat.new()
	
	style.bg_color ="#4b4b4b"
	style.border_color = "#cccccc"
	
	style.set_border_width_all(2)
	style.set_corner_radius_all(3)
	
	return style
	
func createButtonStyleAwake():
	var style = StyleBoxFlat.new()
	
	style.bg_color ="#4b4b4b"
	style.border_color = "#b9b419"
	
	style.set_border_width_all(2)
	style.set_corner_radius_all(3)
	
	return style
