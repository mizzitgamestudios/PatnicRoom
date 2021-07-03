extends DemocrECTS_Controller


# BOOKMARK[epic=Modules] 013_Pcocgen_Loot                                       

# ----- INITIALICER -------------------------------------------------------------- ##


var _lootManager

func _init() -> void:
	_lootManager = _18_TileEntManager.new("API_18_LootEntityManager", ENUM.MINIMAL_COMP.LOOT_TABLE)



func contextualEntityGeneration_quack(dict_or_ent):
	return _lootManager.contextualEntityGeneration_quack(dict_or_ent)




		
