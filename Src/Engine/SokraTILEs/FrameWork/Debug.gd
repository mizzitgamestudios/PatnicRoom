extends Node
class_name SokraTILEs_TilemapDebug

var stringbuffer=""
var character
var file_write_read = File.new()

func writeDebugFile(tilemap):
	file_write_read.open("res://Media/debug/Tilemap.txt", File.WRITE)
	var floorMap=SokraTiles.tilemap["floorTileMap"]

	for x in floorMap:
		for y in floorMap [x]:
			character = floorMap [y][x]
			stringbuffer = stringbuffer+str(character)+" | "

	var string = str(stringbuffer)
	file_write_read.store_string(string)
	file_write_read.close()


func readDebugFile(x,y):
	pass
