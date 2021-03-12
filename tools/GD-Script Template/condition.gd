##########################################################################################################
##  Module:     Conditions                                                                              ##
##  Subfolder:  Components                                                                              ##
##                                                                                                      ##
##  Usage:      Conditions are sequences of Logic or Flags which can be tagged                          ##
##              on an actor or Tile for a limited Time.                                                 ##       
##                                                                                                      ##                                                  
##              Their first Signal emits on every round at the beginning to check                       ##
##              if the effect is stil relevant.The second Signal happens after                          ##
##              the actor took acction, only from here effects modify the actor                         ##
##              when he did not neutraliced.                                                            ##
##              goal is to give new interesseting choices about cancelling out                          ##
##              own debuffs, change Tile attributes or setting up a stretegy                            ##      
##                                                                                                      ##
##  Hint:        even if you can give just one Entity to the Condition by Parameter,                    ##
##              there are ways to add more if needed in run():                                          ##
##              add an Component to the Entity which is a reference to your                             ##
##              second.                                                                                 ##
##              You can plain simply add them as Parameter as well but then                             ##
##              we need to expand the switch in ConditionHub.gd/Comp_Cond_CondHub                       ##
##              and the extensive use of this could get messy over time.                                ##                  
##                                                                                                      ##
##########################################################################################################
extends Component
class_name Comp_Cond_NAME                                                       # INSERT name of condition in NAME (i.e. Comp_Cond_Blind)

var duration: int                                                               # number of times its effect takes place bevore it fades away
var intensity: int                                                              # OPTIONAL value to give effect more dynamic and depth
var affectedEnt: Entity                                                         # reference to the actor which is affected,better performance compared to signals

func _init(parentPara:Entity, durationPara:int, var intensityPara = 0) -> void:   # initialication of intensityPara makes it possibles to skip it in instanciation
	connect("Actor_Turn_Started",self,"_on_Actor_Turn_Started")                 # triggers after player took action, checks if effect is still relevant
	connect("Actor_Turn_Finished",self,"_on_Actor_Turn_Finished")               # triggers after actors action.runs its effect,logs it and takes away one duration
	
	name = "Comp_Cond_NAME"                                                     # IMPORTANT: needs to be the exact like the class_name
	
	duration = durationPara
	intensity = intensityPara
	affectedEnt = parentPara



func run():                                                                     # IMPORTANT: write logic of effect here,you can make further functioncalls in it
	pass



func logEvent() -> void:                                                        #TODO: needs implementation
	print(getLogToString(duration,intensity))

func getLogToString(numberPara:int,altNumberPara:int) -> String:                # can be used to generate the log entry (i.e. worsening or fading)
	var toString: String = ""
	
	match numberPara:
		1:
			toString+" "
		2:
			toString+" "
		3:
			toString+" "
	
	match altNumberPara:
		1:
			toString+" "
		2:
			toString+" "
		3:
			toString+" "
	
	return toString



func isWornOut() -> bool:                                                       # checks if effect happend for the last time
	return duration == 0
func isNeutraliced() -> bool:                                                   # OPTIONAL: write further possibillities to get rid of effect  
	return false



func _on_Actor_Turn_Started():
	if isWornOut():
		affectedEnt.remove_component(name)                                      # removes effect of Entity if no longer needed

func _on_Actor_Turn_Finished():
	if !isNeutraliced():                                                        # checks validity again in case of player took action to neutralice
		logEvent()
		run()
		duration -= 1                                                           # decrement counter untill its 0
	
	else:
		affectedEnt.remove_component(name)  



