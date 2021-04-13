extends Entity
class_name C_51_PLAYER_KITSETS


var listOfKits: Dictionary = {}
var maxKits: int = 10



func _init() -> void:
	self.name = "C_51_PLAYER_KITSETS"
	var owner 

func getKitSet(kitToString:String):
	return listOfKits[kitToString]

func getKitSetByLevel(kitLevel):
	if kitLevel < listOfKits.size():
		return listOfKits.values()[kitLevel]

func addKitSet(kit):
	if listOfKits.size() <= maxKits:
		listOfKits[kit.toString] = kit

static func name_quack():
	return "C_51_PLAYER_KITSETS"
var  autodoc={
	"suggestion"  : "",
	"description" : "name of its fightingstyle",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "role description",
}
static func dioJSONType_quack(): return "ARRAY"
