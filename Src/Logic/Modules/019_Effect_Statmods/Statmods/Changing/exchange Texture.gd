extends Object
class_name U_EXCHANGE_TEXTURE



static func run(selectedPos,modValue):

	var tier = selectedPos.getCompValue("C_65_TIER")
	
	var isValidCheck = false
	if closeTierTwo(selectedPos): isValidCheck = true
	if closeTierOne(selectedPos): isValidCheck = true 
	
	if isValidCheck:
		var textureToChange = selectedPos.getCompValue("C_58_ALTERNATIVE_TEXTURES")
		var currentTexture  = selectedPos.getCompValue("C_2_ANY_TEXTURE_ID")

		selectedPos.getComp("C_58_ALTERNATIVE_TEXTURES").value = currentTexture
		selectedPos.getComp("C_2_ANY_TEXTURE_ID").value        = textureToChange
		
		API_009_Tilemap.appendDirtyTiles(selectedPos)



static func closeTierOne(selectedPos, modValue=0):
	return true



static func closeTierTwo(selectedPos):
	return true
