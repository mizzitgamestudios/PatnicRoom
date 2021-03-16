extends Component
class_name C_53_Actor_SELECTED_TILE

var value = []
var cache = []
var alerted = []

func _init():
	name = "C_53_Actor_SELECTED_TILE"

func reset():                        value = []
func addToCache(arrToCache:Vector2): cache.append(arrToCache)
func appendCacheIntoPerma():
	value += cache
	cache = []


func appendAlerted(arr):  alerted.append(arr)
func resetAlerted():      alerted = []
func getAlerted():        return alerted
 


########################
# --- AUTODOC -------- #
########################
const autodoc={
	"title":"relevant layer",
	"description":"descibes the most relevant layer of Tile",
	"className":"C_3_ANY_LAYER",
	"moduleName":"00_00 Basic Tile Components",
	"dataType":"String",
	"notable":"Needs to be a key of the naming convention 'ENUM.LAYERS_OF_EFFECT.SOKRATILES_LAYER'"
}
static func name_quack():      return "C_53_Actor_SELECTED_TILE"
static func dioJSONType_quack(): return "NULL"