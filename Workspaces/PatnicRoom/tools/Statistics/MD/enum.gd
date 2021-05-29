extends Node
class_name Statistics_enum_MD



static func calcStats():
	var mdWriter = MarkdownWriter.new()
	
	var typesOnMap = ["TILE", "ACTOR", "INTERACT", "MARKER", "PLAYER", "LOOT_SOURCE"]
	writeList(typesOnMap,"TYPES_ON_MAP",mdWriter)
	
	writeList(ENUM.DICT_TYPES_ON_MAP.keys(),"DICT_TYPES_ON_MAP",mdWriter)
	writeList(ENUM.KIT_CATEGORY.keys(),"KIT_CATEGORY",mdWriter)
	writeList(ENUM.SKILL.keys(),"SKILL",mdWriter)
	
	
	writeListComp(ENUM.MINIMAL_COMP_TILE_ENT,"MINIMAL_COMP_TILE_ENT",mdWriter)
	writeListComp(ENUM.MINIMAL_COMP_ACTOR_ENT,"MINIMAL_COMP_ACTOR_ENT",mdWriter)
	writeListComp(ENUM.MINIMAL_COMP_INTERACT_ENT,"MINIMAL_COMP_INTERACT_ENT",mdWriter)
	writeListComp(ENUM.MINIMAL_COMP_KITPART_ENT,"MINIMAL_COMP_KITPART_ENT",mdWriter)
	writeListComp(ENUM.MINIMAL_COMP_LOOT_ENT,"MINIMAL_COMP_LOOT_ENT",mdWriter)
	writeList([ENUM.BASE_GAME_DATA_PATH],"BASE_GAME_DATA_PATH",mdWriter)
	writeList(ENUM.MINIMAL_COMP_EFFECT_UNIT,"MINIMAL_COMP_EFFECT_UNIT",mdWriter)
	
	writeList(ENUM.KIT_PARTS.keys(),"KIT_PARTS",mdWriter)
	writeList(ENUM.KIT_CATEGORIES.keys(),"KIT_CATEGORIES",mdWriter)
	writeList(ENUM.SOKRATILES_LAYER.keys(),"SOKRATILES_LAYER",mdWriter)
	writeList(ENUM.M_TYPES.keys(),"M_TYPES",mdWriter)
	writeList(ENUM.ACTION_PHASE.keys(),"ACTION_PHASE",mdWriter)
	writeList(ENUM.WALK_ACTIONS_BY_DIRECTION,"WALK_ACTIONS_BY_DIRECTION",mdWriter)
	writeList(ENUM.DIRECTION_FOUR.keys(),"DIRECTION_FOUR",mdWriter)
	writeList(ENUM.RARITY.values(),"RARITY",mdWriter)
	writeList(ENUM.RARITY_TO_STRING.values(),"RARITY_TO_STRING",mdWriter)
	writeList(ENUM.ENTROPY_SCALE.values(),"ENTROPY_SCALE",mdWriter)
	writeList(ENUM.ENTROPY_PROGRESS_COLOR.values(),"ENTROPY_PROGRESS_COLOR",mdWriter)
	writeList(ENUM.ROUND_EFFECT_PHASE.keys(),"ROUND_EFFECT_PHASE",mdWriter)
	writeList(ENUM.PANIC_INTERFACE_STATE.keys(),"PANIC_INTERFACE_STATE",mdWriter)
	writeList(ENUM.PANIC_PLAYER_STATE.keys(),"PANIC_PLAYER_STATE",mdWriter)
	writeList(ENUM.KITSET_PHASE.keys(),"KITSET_PHASE",mdWriter)
	writeList(ENUM.KITSET_PHASE.keys(),"KITSET_PHASE",mdWriter)
	writeList(ENUM.KITSET_PHASE.keys(),"KITSET_PHASE",mdWriter)






	mdWriter.writeData("res://tools/Statistics/output/Atlas_Enum.md")



static func writeList(list,name,mdWriter):
	mdWriter.add_header(name,3)
	for i in list.size():
		mdWriter.add_content_new_line(str(i)+". "+str(list[i]))

static func writeListComp(list,name,mdWriter):
	mdWriter.add_header(name,3)
	for i in list.size():
		mdWriter.add_content_new_line(str(i)+". "+str(list[i].name_quack()))
