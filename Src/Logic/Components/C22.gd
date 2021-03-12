extends Component
class_name C_22_ACTOR_LIMITS

var value = {}

func _init(physicalLimit, socialLimit, mentalLimit):
	name = "C_22_ACTOR_LIMITS"
	value = {
		"physicalLimit":physicalLimit,
		"socialLimit":socialLimit,
		"mentalLimit":mentalLimit
	}

func getPysicalLimit():
	return value["physicalLimit"]
	
func getSozialLimit():
	return value["socialLimit"]
	
func getMentallLimit():
	return value["mentalLimit"]
