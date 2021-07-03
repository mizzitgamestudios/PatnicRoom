extends Object
class_name U_EXCHANGE_TEXTURE



static func run(ent,modValue):

	var tier = ent.getCompValue("C_65_TIER")
	
	var isValidCheck = false
	
	if closeTierTwo(ent): isValidCheck = true
	if closeTierOne(ent): isValidCheck = true 
	
	if isValidCheck:
		var textureToChange = ent.getCompValue("C_58_ALTERNATIVE_TEXTURES")
		var currentTexture  = ent.getCompValue("C_2_ANY_TEXTURE_ID")

		ent.getComp("C_58_ALTERNATIVE_TEXTURES").value = currentTexture
		ent.getComp("C_2_ANY_TEXTURE_ID").value        = textureToChange
		
		API_002_Tilemap.appendDirtyTiles(ent)



static func closeTierOne(ent, modValue=0):
	return true



static func closeTierTwo(ent):
	return true
