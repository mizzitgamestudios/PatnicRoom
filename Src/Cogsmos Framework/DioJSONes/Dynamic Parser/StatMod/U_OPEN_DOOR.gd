extends Object
class_name U_OPEN_DOOR



static func run(selectedPos):

	var walkable           = selectedPos.getCompValue("C_1_ANY_IS_WALKABLE")
	var texture            = selectedPos.getCompValue("C_2_ANY_TEXTURE_ID")
	var alternativeTexture = selectedPos.getCompValue("C_58_ALTERNATIVE_TEXTURES")

	var cache              = texture

	selectedPos.getComp("C_1_ANY_IS_WALKABLE").value = true
	selectedPos.getComp("C_2_ANY_TEXTURE_ID").value = alternativeTexture
	selectedPos.getComp("C_58_ALTERNATIVE_TEXTURES").value  = cache
	
	API_009_Tilemap.appendDirtyTiles(selectedPos)
