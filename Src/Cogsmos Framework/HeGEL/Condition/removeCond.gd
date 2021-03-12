extends Component
class_name HeGEL_RemoveCond





func run(ent,condName:String):
	var condToAdd = API_003_Condition.getAllConditions()[condName]
	condToAdd.isNeutraliced = true