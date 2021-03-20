extends Object
class_name U_DEAL_PLAIN_DAMAGE



static func run(selectedPos, modValue):
	selectedPos.getComp("C_57_HITPOINTS").value =selectedPos.getComp("C_57_HITPOINTS").value + int(modValue)
	var value = selectedPos.hitpoints()
	
	if value <= 0: selectedPos.free()

		
