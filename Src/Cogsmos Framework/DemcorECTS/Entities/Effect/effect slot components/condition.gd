extends Component
class_name Effect_Comp_EFFECT_Condition


var condtionList = []


func _init(dict:Array):
	name = "Effect_Comp_EFFECT_Condition"
	
	for i in dict.size():
		var currentCondition = dict[i]

		var conditionClass = API_003_Condition.getConditionByName(currentCondition[0])
		var listEntry = conditionClass.new(int(currentCondition[1]),int(currentCondition[2]))
		
		condtionList.append(listEntry)
	
	
	



