extends Node
class_name FileHandler

func getKitBaseDict(): 		return fileToDictionary("res://config/Forms/KitBase.json")
func getKitModDict():		return fileToDictionary("res://config/Forms/KitMod.json")
func getKitAppendixDict(): 	return fileToDictionary("res://config/Forms/KitAppendix.json")

func getRaceDict(): 		return fileToDictionary("res://config/Forms/ActorRace.json")
func getRoleDict(): 		return fileToDictionary("res://config/Forms/ActorRole.json")
func getSpecialtytDict(): 	return fileToDictionary("res://config/Forms/ActorSpecialty.json")

func getConsumableDict(): 	return fileToDictionary("res://config/Forms/ItemsConsumable.json")



func fileToDictionary(filepath:String):
	var fileToDictionaryFile = File.new()
	fileToDictionaryFile.open(filepath,File.READ)
	var fileToDictionaryJSON = JSON.parse(fileToDictionaryFile.get_as_text())
	fileToDictionaryFile.close()
	
	return fileToDictionaryJSON.result



func printForm(dict:Dictionary):
	var filepath = Bootstrap.getFilepathToSave(dict["C_6_TILE_NAME"])
	var file = File.new()
	file.open(filepath,File.WRITE)
	file.store_string(JSON.print(dict,"\t"))
	file.close()
	print(dict)

func getModule(moduleString):
	var dict = Utils.fileToDictionary("res://config/ModulesReference.json")
<<<<<<< HEAD
	if moduleString != "VOID": return dict[moduleString]
=======
	return dict[moduleString]
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684

