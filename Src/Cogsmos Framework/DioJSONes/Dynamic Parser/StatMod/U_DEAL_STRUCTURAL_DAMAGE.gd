extends Object
class_name U_DEAL_STRUCTURAL_DAMAGE



static func run(selectedPos, modValue):
	selectedPos.getComp("C_8_STRUCTURE_HP").value -= modValue
	
	if selectedPos.getCompValue("C_8_STRUCTURE_HP") <= 0:
		selectedPos.getComp("C_2_ANY_TEXTURE_ID").value = "Suburban_0_2"
		selectedPos.getComp("C_1_ANY_IS_WALKABLE").value = true
	

	
	API_009_Tilemap.appendDirtyTiles(SokraTiles.getMeatInteract(),selectedPos)

	
 
