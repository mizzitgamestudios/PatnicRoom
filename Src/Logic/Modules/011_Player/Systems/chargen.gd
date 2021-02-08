extends Node
class_name _011_Chargen


func generateNewChar(kit:String,perk:String,race:String,name:String):
	var filledChargenPreset:Dictionary = getFilledChargenPreset(kit,perk,race,name)
	API_011_Player.setCurrentCharByDict(filledChargenPreset)
	
func getFilledChargenPreset(kit:String,perk:String,race:String,name:String):
	var dictOfPlayer = API_011_Player.chargenSelecttionToLoad
	
	dictOfPlayer["playerName"] = name
	dictOfPlayer["race"] = race
	dictOfPlayer["perks"].append(perk)
	dictOfPlayer["Kits"][0]["Base"] = randomSelectkit(kit)
	
	return dictOfPlayer






func randomSelectkit(kit:String):
	var group = getGroup(kit).entitiesInGroup
	var rng = Util.RNG.getRandomNumber(1,group.size()-1)

	var selectedKitPart = group.values()[rng].name.value
	print(selectedKitPart)

	return selectedKitPart

	
func getGroup(kitCat:String):
	match kitCat:
		"gun":
			return DemokrECTS.groupManager.atlas_Gun_Frame
		"meele":
			return DemokrECTS.groupManager.atlas_Meele_Type
		"armor":
			pass
			
		"spell":
			return DemokrECTS.groupManager.atlas_Spell_Form
		"infusion":
			return DemokrECTS.groupManager.atlas_Infusion_Tattoo
		"armor":
			pass
		
		"cyberware":
			return DemokrECTS.groupManager.atlas_Cyberware_Model
		"hack":
			return DemokrECTS.groupManager.atlas_Hacks_Codebase
		"drones":
			pass
	
