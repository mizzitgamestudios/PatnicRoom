extends Component
class_name C_64_APPLY_CONDITION_WALKING

var value
var condIndex 
var level
var duration

func _init(valuePara:String):
	name="C_64_APPLY_CONDITION_WALKING"
	value = valuePara
	
	var cache = valuePara.split("(")
	duration  = cache[1].split(")")[0]
	
	var cacheTwo     = valuePara.split("[]")
	if cacheTwo.size() > 1:  level  = cacheTwo[1].split("]")[0]
	
	condIndex = cache[0]



########################
# --- AUTODOC -------- #
########################
static func getAutoDoc(): return{
	"suggestion"  : "",
	"description" : "applies condition when walking on tile",
	"validInputs" : [],
	"validType"   : dioJSONType_quack(),
	"nameToShow"  : "condition by walking",
}
static func name_quack():      return "C_64_APPLY_CONDITION_WALKING"
static func dioJSONType_quack(): return "STRING"
