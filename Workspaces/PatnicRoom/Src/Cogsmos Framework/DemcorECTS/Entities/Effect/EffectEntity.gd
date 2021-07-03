
# CLASS                                                                              
# DOCS 	https://mizzitgamestudios.github.io/mkDocs/site/Entities/effect/             
# CLASS                                                                              
# BOOKMARK[epic=Entities_Effect] Effect                                              
extends Object
class_name EffectEntity


var offsetComponent: Effect_Unit_Component
var spawnComponent:  Effect_Unit_Component
var onsetComponent:  Effect_Unit_Component
var hitComponent: 	 Effect_Unit_Component


<<<<<<< HEAD
func _init(allSlots):
	self.spawnComponent  = allSlots[0]
	self.onsetComponent  = allSlots[1]
	self.hitComponent    = allSlots[2]
	self.offsetComponent = allSlots[3]



# VAR will be removed when its duration == 0 
var phaseStack = [
	ENUM.KITS.PHASE.SPAWN,
	ENUM.KITS.PHASE.ONSET,
	ENUM.KITS.PHASE.HIT,
	ENUM.KITS.PHASE.OFFSET,
=======
# VAR will be removed when its duration == 0 
var phaseStack = [
	ENUM.KITSET_PHASE.SPAWN,
	ENUM.KITSET_PHASE.ONSET,
	ENUM.KITSET_PHASE.HIT,
	ENUM.KITSET_PHASE.OFFSET,
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
]



# ----- SIGNALS -------------------------------------------------------------- ##

# FUNC called by KitSetEntity.run() 
func activate():
	print("KITSET GOT ACTIVATED")
	Signals.connect("Effect_Turn_Finished",self,"on_effectTurn")

	
# REFACTOR    also in ConditionEntity        
func on_effectTurn():
	if is_instance_valid(getPhase()):
			
		if getPhase().delay == 0: 
			getPhase().run(); phaseStack.pop_front()
		else:
			getPhase().delay -= 1
	
	else: phaseStack.pop_front()

		
func getPhase() -> Effect_Unit_Component:
	match phaseStack.front():
<<<<<<< HEAD
		ENUM.KITSET_PHASE.OFFSET : return offsetComponent
		ENUM.KITSET_PAHSE.SPAWN  : return spawnComponent
		ENUM.KITSET_PHASE.ONSET  : return onsetComponent
		ENUM.KITSET_PHASE.HIT    : return hitComponent
		null                     : free()
=======
		ENUM.KITSET_PHASE.OFFSET: return offsetComponent
		ENUM.KITSET_PAHSE.SPAWN: return spawnComponent
		ENUM.KITSET_PHASE.ONSET: return onsetComponent
		ENUM.KITSET_PHASE.HIT: return hitComponent
		null : free()
>>>>>>> 14ed4bc523602584d0fecdfce3fc61f9ee8a2684
	return null


