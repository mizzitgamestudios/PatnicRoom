extends Node


var EFFECT
var NPC
var LOOT_TABLE


func _init() -> void:
	EFFECT          = Effect_Syntax.new()
	LOOT_TABLE      = LootTable_Syntax.new()
	NPC             = NPC_Syntax.new()
	



func NPC()         -> NPC_Syntax:        return NPC 
func EFFECT()      -> Effect_Syntax:     return EFFECT.ENTRIES
func LOOT_TABLE()  -> LootTable_Syntax:  return LOOT_TABLE 




	
