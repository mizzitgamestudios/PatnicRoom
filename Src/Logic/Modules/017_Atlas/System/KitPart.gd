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

		match currentKitpart.catType():
			"CYBERWARE":
				cyberware[currentKitpart.name()] 	= KitpartEntry.new( currentKitpart )
			"HACK":
				hack[currentKitpart.name()] 		= KitpartEntry.new( currentKitpart )
			"DRONE":
				drone[currentKitpart.name()] 		= KitpartEntry.new( currentKitpart )

			"MEELE":
				meele[currentKitpart.name()] 		= KitpartEntry.new( currentKitpart )
			"GUN":
				gun[currentKitpart.name()] 			= KitpartEntry.new( currentKitpart )
			"ARMOR":
				armor[currentKitpart.name()] 		= KitpartEntry.new( currentKitpart )

			"INFUSION":
				infusion[currentKitpart.name()] 	= KitpartEntry.new( currentKitpart )
			"SPELL":
				spell[currentKitpart.name()]		= KitpartEntry.new( currentKitpart )
			"RITE":
				rite[currentKitpart.name()] 		= KitpartEntry.new( currentKitpart )


class KitpartEntry:
	var baseKit
	var modArr = {}

	func _init(basepara) -> void:
		baseKit = basepara

		var arr = API_017_Atlas._kitparts.getEntitiesWithCompValue(basepara.name(),C_56_BASE_CONNECTOR.name_quack())
		for i in arr.size():
			modArr[arr[i].name()] = arr[i]







