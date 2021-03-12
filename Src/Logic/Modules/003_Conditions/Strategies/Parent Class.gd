extends Node
class_name Cond_Parent

 
################################################################################
##  --- VARIABLES ---                                                         ##
################################################################################

var id: int
var level: int
var duration: int
var isNeutraliced: bool
var logToString: String
var affectedEnt: Entity
var symbioticComponents: Dictionary
var conditionSymbiotic: Dictionary # []
var statSymbiotic: Dictionary # [][4]
 


################################################################################
##  --- INITIALICER ---                                                       ##
################################################################################

func _init() -> void:
	#
	Signals.connect("updateEntropy", self, "_On_Update_Entropy")
	
	#Signals.connect("Effect_Turn_Finished",self,"validatePossibleSymbiotics")



################################################################################
##  --- HELPERS ---                                                           ##
################################################################################

func searchAndGetSymbioticComponent(componentName:String):
	if symbioticComponents.has(componentName):
		return symbioticComponents[componentName]

func getArrayOfSymbioticComponents():
	return symbioticComponents.keys()


func attachToEnt(ent,condName):
	Signals.connect("Effect_Turn_Finished", self, "validatePossibleSymbiotics")
	self.affectedEnt = ent
	ent.dictOfConds[condName]= self



################################################################################
##  --- AUTOMATICATION ---                                                    ##
################################################################################

func isWornOut() -> bool:
	return duration == 0

func _On_Update_Entropy():
	if isWornOut():
		self.free()

func _On_Effect_Turn_Finished():
	if !isNeutraliced(): 
		run()
		duration -= 1   
	else:
		self.free()



################################################################################
##  --- LOGIC FOR TYPEDUCKING ---                                             ##
################################################################################

func isNeutraliced() -> bool:
	return isNeutraliced



func run():
	pass





func validatePossibleSymbiotics():
	condSymbioticValidate()
	statSymbioticValidate()




func condSymbioticValidate():
	for i in conditionSymbiotic.size():
		var currentCondSet:bool = true

		#for j in conditionSymbiotic.keys()[i].size():
			
		#	if !affectedEnt.dictOfConds.has(conditionSymbiotic.keys()[i][j]): 
		#		currentCondSet = false

		#if currentCondSet:

		if affectedEnt.dictOfConds.has(conditionSymbiotic.keys()[i]): 
			conditionSymbiotic.values()[i].run(affectedEnt)




func statSymbioticValidate():
	for i in statSymbiotic.keys().size():
		var currentStatSet:bool = true
		for j in statSymbiotic.keys()[i].size():
			
			var currentStat       = statSymbiotic.keys()[i][j][0]
			var currentOperant    = statSymbiotic.keys()[i][j][1]
			var currentComparator = statSymbiotic.keys()[i][j][2]

			var statOfEnt = affectedEnt.getCompValue(currentStat)

			match currentOperant:
				"<":
					if !(statOfEnt < currentComparator)  : currentStatSet = false
				">":
					if !(statOfEnt >  currentComparator) : currentStatSet = false
				"==":
					if !(statOfEnt == currentComparator) : currentStatSet = false
				"!=":
					if !(statOfEnt != currentComparator) : currentStatSet = false
		
		if currentStatSet:
			statSymbiotic.values()[i].run()
