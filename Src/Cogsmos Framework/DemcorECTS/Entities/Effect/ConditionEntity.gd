extends Node
class_name Cond_Parent


#----- INITIALICER ---------------------------------------------------------------##

var level                : int
var duration             : int
var logToString          : String

var affectedEnt          : Entity


var conditionSymbiotic   : Dictionary    # []
var initStatSymbiotic    : Array         # [ ["HP",">","100","I_1"],["HP",">","100","I_1"] ]
var listOfStatSymbiotics : Array


func _init() -> void:
	Signals.connect("updateEntropy", self, "_On_Update_Entropy")
	
	for i in initStatSymbiotic.size(): 
		listOfStatSymbiotics.append( StatSymbiotics.new(initStatSymbiotic[i]) )
	


func attachToEnt(ent,className:String):
	Signals.connect("Effect_Turn_Started", self, "_On_Effect_Turn_Started")
	Signals.connect("Effect_Turn_Finished", self, "validatePossibleSymbiotics")
	
	self.affectedEnt                        = ent
	ent.dictOfConds[className] = self

	

#----- AUTOMATION ----------------------------------------------------------------##

func _On_Effect_Turn_Started():
	if !is_instance_valid(affectedEnt) :
		self.queue_free()
	elif is_instance_valid(affectedEnt):
		print("neutralized " + str(!isNeutraliced()))
		if duration >= 0:
			if !isNeutraliced(): 
				run()
				duration -= 1;
		else:
			affectedEnt.dictOfConds.erase(indexName_quack())
			self.queue_free()




#----- CUSTOME PART --------------------------------------------------------------##

func isNeutraliced(): pass
func run():           pass



#----- SYMBIOTICS ----------------------------------------------------------------##

func validatePossibleSymbiotics():
	condSymbioticValidate()
	statSymbioticValidate()


func condSymbioticValidate():
	for i in conditionSymbiotic.size():
		var currentCondSet:bool = true

		if affectedEnt.dictOfConds.has(conditionSymbiotic.keys()[i]): 
			conditionSymbiotic.values()[i].run(affectedEnt)



class StatSymbiotics:
	var statToCompare
	var operant
	var comparator
	var injectionComponent

	func _init(arrOfIf:Array): 
		statToCompare 		= arrOfIf[0] 
		operant       		= arrOfIf[1]
		comparator    		= arrOfIf[2]
		injectionComponent	= arrOfIf[3]


func statSymbioticValidate():
	for i in listOfStatSymbiotics.size():
		var currentComparrison = listOfStatSymbiotics[i]

		var statOfEnt      = affectedEnt.getCompValue(currentComparrison.statToCompare)
		var currentStatSet = true
		
		match currentComparrison.operant:
			"<" :  if !(statOfEnt <  currentComparrison.comparator) : currentStatSet = false
			">" :  if !(statOfEnt >  currentComparrison.comparator) : currentStatSet = false
			"==":  if !(statOfEnt == currentComparrison.comparator) : currentStatSet = false
			"!=":  if !(statOfEnt != currentComparrison.comparator) : currentStatSet = false
	
			
		if currentStatSet : currentComparrison.injectionComponent.run()

			
func indexName_quack(): return ""
func hasNotConditionAlready(entToSpread):
	return !entToSpread.dictOfConds.has(self.indexName_quack()) or !is_instance_valid(entToSpread.dictOfConds[indexName_quack()])
