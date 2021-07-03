extends Component
class_name HeGEL_RemoveCond





func run(ent,condName:String):
	var condToAdd = API_008_Condition.getAllConditions()[condName]
	condToAdd.isNeutraliced = true
