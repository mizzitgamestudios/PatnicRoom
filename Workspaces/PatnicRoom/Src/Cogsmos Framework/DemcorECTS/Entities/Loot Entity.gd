
# CLASS                                                                              
# DOCS  https://mizzitgamestudios.github.io/mkDocs/site/Entities/interact/           
# CLASS                                                                              
# BOOKMARK[epic=Entities_Misc] Loot                                                  
extends InteractEntity
class_name LootSourceEntity

# STUB                                                                               



func lootTable(): 		return getCompValue(C_61_LOOT_TABLE.name_quack())
func lootState(): 		return getCompValue(C_62_LOOT_STATE.name_quack())


func typeToString(): return "LOOT_SOURCE"


