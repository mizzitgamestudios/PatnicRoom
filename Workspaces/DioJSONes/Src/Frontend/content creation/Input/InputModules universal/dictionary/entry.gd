extends Node2D



func initialice(entry,counter):
	entry = entry.split(":")
	
	position = Vector2(0,30*counter)
	get_node("entry1/typeRTL").bbcode_text = entry[0]
