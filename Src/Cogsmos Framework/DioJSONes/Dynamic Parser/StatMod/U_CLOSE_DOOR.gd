extends Object
class_name U_CLOSE_DOOR



static func run(selectedPos,modValue):

	if modValue == "TIER_1": closeTierOne(selectedPos)
	if modValue == "TIER_2": closeTierTwo(selectedPos)




static func closeTierOne(selectedPos, modValue=0):
	var textureToPrint
	if selectedPos.textureID() == "Suburban_2_0": textureToPrint = "Suburban_4_0"
	if selectedPos.textureID() == "Suburban_2_1": textureToPrint = "Suburban_4_1"
	U_SPAWN_TILE.run(selectedPos,textureToPrint)
	
	var debug = SokraTiles.getMeatInteract().entsOnMap
	var debugPos = selectedPos.pos()
	
	var cache = selectedPos.pos()
	selectedPos.setPos(Vector2(cache.x,cache.y))
	
	debug[debugPos] = selectedPos.get_instance_id()
	API_009_Tilemap.appendDirtyTiles(selectedPos)


static func closeTierTwo(selectedPos):
	var textureToPrint
	if selectedPos.textureID() == "Suburban_2_0": textureToPrint = "Suburban_4_3"
	if selectedPos.textureID() == "Suburban_2_1": textureToPrint = "Suburban_4_4"
	U_SPAWN_TILE.run(selectedPos,textureToPrint)
