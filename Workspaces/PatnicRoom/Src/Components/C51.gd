extends Component
<<<<<<< HEAD
class_name C_51_PLAYER_KITSETS


var listOfKits: Dictionary = {}
var maxKits: int = 10

func _init() -> void:
	self.name = "C_51_PLAYER_KITSETS"



func getKitSetDict():                  			return listOfKits

func getKitSetByString(kitToString:String):    	return listOfKits[kitToString]
func getKitSetByNr(kitsetNr:int):      			return listOfKits.values()[kitsetNr]



func getKitSetByLevel(kitLevel):
	if int(kitLevel) < listOfKits.size():
		return listOfKits.values()[int(kitLevel)]

func addKitSet(kit):
	if listOfKits.size() <= maxKits:
		listOfKits[kit.toString] = kit




static func name_quack():          return "C_51_PLAYER_KITSETS"
static func dioJSONType_quack():   return "ARRAY"
static func getAutoDoc():
	return{
		"suggestion"  : "",
		"description" : "name of its fightingstyle",
		"validInputs" : [],
		"validType"   : dioJSONType_quack(),
		"nameToShow"  : "role description",
}
=======
class_name C_50_ACTOR_ROLE_DESCRIPTION

var value 

func _init(valuePara):
	name="C_50_ACTOR_ROLE_DESCRIPTION"
	value=valuePara



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "like description a flavor-text",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "role description",
}
static func name_quack():      return "C_50_ACTOR_ROLE_DESCRIPTION"
static func dioJSONType_quack(): return "STRING"
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
