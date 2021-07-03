extends Component
class_name HeGEL_AddCond



func run(ent,condName:String):
	var condToAdd = API_008_Condition.getAllConditions()[condName]
	condToAdd.attachToEnt(ent)
