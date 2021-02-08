extends Node
class_name _01_01_Logger



func _print_head_log_entry() -> void:
	print("----- EXCEPTION -----")
	print("in Module: "+API_000_BasicTilesAtlas.name)
func _print_separator() -> void:
	print()
	print()



func logMissingKeyInDictForTileGeneration(key:String):
	_print_head_log_entry()
	print(ENUM.EXCEPTION_TYPE["1"])

	print("The Component "+key+" for "+" is needed but missing")
	_print_separator()







