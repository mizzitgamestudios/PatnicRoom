extends Object
class_name I_1_Binary_Comparison

var conditionOne
var conditionTwo
var condtionThree


func _init(cOne, cTwo, cThree) -> void:
	conditionOne  = cOne
	conditionTwo  = cTwo
	condtionThree = cThree
	
	
func run(affectedEnt):
	if affectedEnt.dictOfConds.has(conditionOne) and affectedEnt.dictOfConds.has(conditionTwo):

		#if is_instance_valid(affectedEnt.dictOfConds[conditionOne]) and is_instance_valid(affectedEnt.dictOfConds[conditionTwo]):

			var comparisonResult =     HeGEL_Binary_Comparison.run([conditionOne, conditionTwo])

			if comparisonResult < 0:   affectedEnt.dictOfConds[conditionOne].queue_free()
			elif comparisonResult > 0: affectedEnt.dictOfConds[conditionTwo].queue_free()
			else:                      
				affectedEnt.dictOfConds[conditionOne].queue_free()
				affectedEnt.dictOfConds[conditionTwo].queue_free()

		#else:
			if !is_instance_valid(conditionOne): affectedEnt.dictOfConds.erase(conditionOne)
			if !is_instance_valid(conditionTwo): affectedEnt.dictOfConds.erase(conditionTwo)
