extends Component
class_name T_1_REQUIRED_RACE

var value 


func _init(valuePara):
	name  = "T_1_REQUIRED_RACE"
	value = valuePara



	
static func getAutoDoc(): return{
	"suggestion"  : "öewfljqewpivgrpinrv",
	"description" : "quality of Item",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "tier",
}
static func name_quack():          return "T_1_REQUIRED_RACE"
static func dioJSONType_quack():   return "TEMPLATE"

static func getAtlasClass():       return API_001_Atlas.Role()
static func getAtlasEntries():     return API_001_Atlas.RoleAtlas()

