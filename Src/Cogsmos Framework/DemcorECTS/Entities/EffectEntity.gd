extends Object
class_name EffectEntity


#----- INITIALICE ------------------------------------------------------------##

var offsetComponent: Effect_Unit_Component
var spawnComponent:  Effect_Unit_Component
var onsetComponent:  Effect_Unit_Component
var hitComponent: 	 Effect_Unit_Component


var phaseStack = [
	ENUM.KITSET_PHASE.SPAWN,
	ENUM.KITSET_PHASE.ONSET,
	ENUM.KITSET_PHASE.HIT,
	ENUM.KITSET_PHASE.OFFSET,
]



#----- SIGNALS ---------------------------------------------------------------##

func activate():
	print("KITSET GOT ACTIVATED")
	Signals.connect("Effect_Turn_Finished",self,"on_effectTurn")


func on_effectTurn():
	if is_instance_valid(getPhase()):
			
		if getPhase().delay == 0: 
			getPhase().run(); phaseStack.pop_front()
		else:
			getPhase().delay -= 1
	
	else: phaseStack.pop_front()

		
func getPhase() -> Effect_Unit_Component:
	match phaseStack.front():
		ENUM.KITSET_PHASE.OFFSET: return offsetComponent
		ENUM.KITSET_PAHSE.SPAWN: return spawnComponent
		ENUM.KITSET_PHASE.ONSET: return onsetComponent
		ENUM.KITSET_PHASE.HIT: return hitComponent
		null : free()
	return null


