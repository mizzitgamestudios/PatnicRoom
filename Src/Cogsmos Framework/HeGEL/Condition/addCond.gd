extends Component
class_name HeGEL_AddCond



func run(ent,condName:String):
	var condToAdd = API_003_Condition.getAllConditions()[condName]
	condToAdd.attachToEnt(ent)
