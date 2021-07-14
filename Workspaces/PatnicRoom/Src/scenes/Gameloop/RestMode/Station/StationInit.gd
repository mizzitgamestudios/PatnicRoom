extends Node2D

var kitset:KitSetEntity
var nodeNrToStirng = [ "one" , "two" , "three" ]
var metaValues     = Rest_Form_Getter.getFormMeta()

func _ready():
	get_node("background").texture = Util.RNG.getRngBackground()
	var mTypeValues                = metaValues[DavINCi.externalCachedInput]
	Gameloop.scene                 = self
	
	var contents = mTypeValues["names"]
	
	loadIcons(mTypeValues["symbols"])
	
	swapToNewStation()

func loadIcons(symbols):
	get_node("Title/Panel/1").texture = load(symbols[0])
	get_node("Title/Panel/2").texture = load(symbols[1])
	get_node("Title/Panel/3").texture = load(symbols[2])




func swapToNewStation():
	var categoriesInStation = metaValues[DavINCi.externalCachedInput]["names"][0]
	if ENUM.GET_IN_DICT(categoriesInStation,ENUM.KITS.CAT_MAGIC):   API_006_Player.stations.changeStation(ENUM.SOKRATILES.M_TYPE.MAGIC)
	if ENUM.GET_IN_DICT(categoriesInStation,ENUM.KITS.CAT_MATRIX):  API_006_Player.stations.changeStation(ENUM.SOKRATILES.M_TYPE.MEAT) 
	if ENUM.GET_IN_DICT(categoriesInStation,ENUM.KITS.CAT_MEAT):    API_006_Player.stations.changeStation(ENUM.SOKRATILES.M_TYPE.MATRIX)


func on_currentKit_Add(partEnum: int) -> void:
	var kitsetCache = get_node("current Kit").kitset
	
	var cachedCategory = kitsetCache.base.getCompValue("C_31_KIT_CAT_TYPE")
	var catEnum = ENUM.GET_IN_STRING(cachedCategory,"CATEGORY")
	
	var scene = load("res://Src/scenes/Gameloop/RestMode/Station/Fill Form/table.tscn").instance()
	get_parent().add_child(scene)
	scene.initialice(catEnum,partEnum)
	
	
