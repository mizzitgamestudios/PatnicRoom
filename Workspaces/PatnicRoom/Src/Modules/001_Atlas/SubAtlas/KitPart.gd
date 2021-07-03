extends DemokrECTS_Atlas
class_name _17_Kitparts


# ----- INITIALICE ----------------------------------------------------------- ##


var cyberware 	= {}
var hack 		= {}
var drone 		= {}
var mTypeMeat	= [cyberware,hack,drone]

var infusion 	= {}
var spell 		= {}
var rite 		= {}
var mTypeMagic	= [infusion,spell,rite]

var meele 		= {}
var gun 		= {}
var armor 		= {}
var mTypeMatrix = [meele,gun,armor]

var allBasekitGroups = {
	 ENUM.KITS.CATEGORY.CYBERWARE	: cyberware 
	,ENUM.KITS.CATEGORY.HACK		: hack
	,ENUM.KITS.CATEGORY.DRONE		: drone
	,ENUM.KITS.CATEGORY.INFUSION 	: infusion
	,ENUM.KITS.CATEGORY.SPELL 		: spell
	,ENUM.KITS.CATEGORY.RITE		: rite
	,ENUM.KITS.CATEGORY.MEELE 		: meele
	,ENUM.KITS.CATEGORY.GUN			: gun
	,ENUM.KITS.CATEGORY.ARMOR		: armor
}

func _init() -> void:
	classOfEntries = KitPartEntity
	indexComponent = C_12_KITSET_INDEX.name_quack()



# ----- SETTER --------------------------------------------------------------- ##


func sortEntries():
	var baseKitParts = .getEntitiesWithCompValue(ENUM.KITS.PARTS.BASE,"C_38_KIT_PART_TYPE")

	for i in baseKitParts.size():
		var currentKitpart = baseKitParts.values()[i]
		
		var currentKitName = currentKitpart.name()
		var currentKitType = currentKitpart.catType()
		
		var kitpartEntry   = KitpartEntry.new(currentKitpart)
		
		match currentKitType:
			"CYBERWARE" : cyberware [currentKitName] = kitpartEntry
			"HACK"      : hack      [currentKitName] = kitpartEntry
			"DRONE"     : drone     [currentKitName] = kitpartEntry

			"MEELE"     : meele     [currentKitName] = kitpartEntry
			"GUN"       : gun       [currentKitName] = kitpartEntry
			"ARMOR"     : armor     [currentKitName] = kitpartEntry

			"INFUSION"  : infusion  [currentKitName] = kitpartEntry
			"SPELL"     : spell     [currentKitName] = kitpartEntry
			"RITE"      : rite      [currentKitName] = kitpartEntry



# ----- GETTER --------------------------------------------------------------- ##


func getDirectByAtlas(nameOfKit:String):                    return atlas_Entry[nameOfKit]
func getBaseKitByKitAndName(kit:int,nameOfBaseKit:String):  return allBasekitGroups[kit][nameOfBaseKit].baseKit


func getKitGroup(string_enum_kitGroup):
	var enumOfString
	if string_enum_kitGroup is String: enumOfString = ENUM.GET_IN_STRING(string_enum_kitGroup,"CATEGORY")
	if string_enum_kitGroup is int:    enumOfString = string_enum_kitGroup
	return allBasekitGroups[enumOfString]



# ----- HELPER --------------------------------------------------------------- ##


class KitpartEntry:
	var baseKit
	var modArr = {}

	func _init(basepara) -> void:
		baseKit = basepara
		var arr = API_001_Atlas._kitparts.getEntitiesWithCompValue(basepara.name(), "C_60_BASE_KIT_REFERENCE")

		for i in arr.size():
			var currentMod           = arr.values()[i]
			modArr[currentMod.name()] = arr.values()[i]




