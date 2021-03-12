extends Component
class_name C_53_Actor_SELECTED_TILE

var value = []
var cache = []
var alerted = []

func _init():
	name = "C_53_Actor_SELECTED_TILE"

func reset():
	value = []

func addToCache(arrToCache:Vector2):
	cache.append(arrToCache)

func appendCacheIntoPerma():
	value += cache
	cache = []

static func name_quack():
	return "C_53_Actor_SELECTED_TILE"



func appendAlerted(arr):
	alerted.append(arr)


func resetAlerted():
	alerted = []


func getAlerted():
	return alerted
