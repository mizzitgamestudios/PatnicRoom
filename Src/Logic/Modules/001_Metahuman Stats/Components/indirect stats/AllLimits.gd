extends Component
class_name Comp_Actor_AllLimits

var value = {}

func _init(physicalLimit, socialLimit, mentalLimit):
	name = "Comp_Actor_AllLimits"
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
