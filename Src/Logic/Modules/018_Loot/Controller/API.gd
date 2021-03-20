extends DemocrECTS_Controller


#----- INITIALICER ---------------------------------------------------------------##


var _lootManager

func _init() -> void:
	_lootManager = _18_TileEntManager.new("API_18_LootEntityManager", ENUM.MINIMAL_COMP_LOOT_ENT)



func contextualEntityGeneration_quack(dict_or_ent):
	return _lootManager.contextualEntityGeneration_quack(dict_or_ent)




		
