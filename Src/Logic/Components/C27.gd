extends Component
class_name C_27_ACTOR_RACIAL_ENEMIES

var races = []

func _init(entRacesArrayPara):
	name = "C_27_ACTOR_RACIAL_ENEMIES"
	races = entRacesArrayPara

func addToInventory(entPara):
	races.append(entPara)

func removeFromInventory(entPara):
	races.remove(entPara)


