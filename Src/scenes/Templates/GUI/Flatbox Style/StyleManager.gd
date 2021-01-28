extends Control
class_name StyleManager


var style = StyleBoxFlat.new()

func setToDefault():
	style.bg_color=Color("#334369")
	style.border_color=Color("#9eabc7")
	style.border_width_bottom=3
	style.border_width_left=3
	style.border_width_right=3
	
	
	style.border_width_top=3
	return style

func setInputzone(x,y,width,height):
	var entry = Panel.new()
	
	entry._set_global_position(Vector2(x,y))
	entry.set_size(Vector2(width,height) )
	
	entry.name="entry"
	entry.set('custom_styles/panel', style)
	
	return entry

