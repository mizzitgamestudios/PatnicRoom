extends Component
class_name Comp_Actor_RacialFriends

var races = []

func _init(entRacesArrayPara):
	name = "Comp_Actor_RacialFriends"
	races = entRacesArrayPara

func addToInventory(entPara):
	races.append(entPara)

func removeFromInventory(entPara):
	races.remove(entPara)



