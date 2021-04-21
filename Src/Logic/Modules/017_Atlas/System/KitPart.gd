extends DemokrECTS_Atlas
class_name _17_Kitparts

#----- INITIALICE ------------------------------------------------------------##

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
	"cyberware":cyberware, "hack":hack,   "drone":drone,
	"infusion":infusion,   "spell":spell, "rite":rite,
	"meele":meele,         "gun":gun,     "armor":armor
}

func getDirectByAtlas(nameOfKit:String):
	return atlas_Entry[nameOfKit]

func getBaseKitByKitAndName(kit:String,nameOfBaseKit:String):
	return allBasekitGroups[kit][nameOfBaseKit].baseKit


func _init() -> void:
	classOfEntries = KitPartEntity
	indexComponent = C_6_TILE_NAME.name_quack()

func sortEntries():
	var baseKitParts = .getEntitiesWithCompValue(ENUM.KIT_PARTS.BASE,C_38_KIT_PART_TYPE.name_quack())

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




class KitpartEntry:
	var baseKit
	var modArr = {}

	func _init(basepara) -> void:
		baseKit = basepara
		var arr = API_017_Atlas._kitparts.getEntitiesWithCompValue(basepara.name(), "C_60_BASE_KIT_REFERENCE")

		for i in arr.size():
			var currentMod           = arr.values()[i]
			modArr[currentMod.name()] = arr.values()[i]







