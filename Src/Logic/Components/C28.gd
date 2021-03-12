extends Component
class_name C_28_ACTOR_RACIAL_FRIENDS

var races = []

func _init(entRacesArrayPara):
	name = "C_28_ACTOR_RACIAL_FRIENDS"
	races = entRacesArrayPara

func addToInventory(entPara):
	races.append(entPara)

func removeFromInventory(entPara):
	races.remove(entPara)



