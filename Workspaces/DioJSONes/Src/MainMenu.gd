extends Node2D


var kitForm    = "res://Src/Frontend/content creation/Forms/Kit/Form.tscn"
var actorsForm = "res://Src/Frontend/content creation/Forms/Actors/Form.tscn"
var itemsForm  = "res://Src/Frontend/content creation/Forms/Gear/Items/Form.tscn"


func _ready() -> void:
	var dict                   = Utils.fileToDictionary("res://Bootstrap.json")
	Utils.filePathToPatnicroom = dict["filepath to the P@nicRoom Rootfolder"]


# MAIN MENUE POINTS #
func startKitBase(): 		return loadForm("res://config/Forms/KitBase.json"         , kitForm    )
func startKitMod():			return loadForm("res://config/Forms/KitMod.json"          , kitForm    )
func startKitAppendix(): 	return loadForm("res://config/Forms/KitAppendix.json"     , kitForm    )

func startActorsRace(): 	return loadForm("res://config/Forms/ActorRace.json"       , actorsForm )
func startActorRole(): 		return loadForm("res://config/Forms/ActorRole.json"       , actorsForm )
func startActorSpecialty(): return loadForm("res://config/Forms/ActorSpecialty.json"  , actorsForm )

func getItemsConsumable(): 	return loadForm("res://config/Forms/ItemsConsumable.json" , itemsForm  )


func loadForm(filepathJSON,filepathTSCN):
	Utils.componentsToLoad = Utils.fileToDictionary(filepathJSON)
	get_tree().change_scene(filepathTSCN)





func _on_browse_pressed() -> void:
	get_tree().change_scene("res://Src/Frontend/content management/Browse/Browse.tscn")
