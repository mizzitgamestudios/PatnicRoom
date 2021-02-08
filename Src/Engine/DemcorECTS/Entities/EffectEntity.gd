extends Entity
class_name EffectEntity

func _init():
	#Signals.connect("Effect_Turn",self,"decrementDelay")
	pass

var spawnComponent: EffectTComponent
var onsetComponent: EffectTComponent
var hitComponent: EffectTComponent
var offsetComponent: EffectTComponent

var delaysOfPhase:Array
var phases = [spawnComponent,onsetComponent,hitComponent,offsetComponent]

func getCurrentDelay():
	for i in delaysOfPhase.size():
		if delaysOfPhase[i] != 0:
			return delaysOfPhase[i]

func getCurrentPhaseComponent():
	for i in delaysOfPhase.size():
		if delaysOfPhase[i] != 0:
			return phases[i]

func decrementDelay():
	for i in delaysOfPhase.size():
		print(delaysOfPhase[i])
		if delaysOfPhase[i] != 0:
			
			delaysOfPhase[i] -=1
			checkIsEffectToRun(i)


func checkIsEffectToRun(i):
	if delaysOfPhase[i] == 0:
		print(getCurrentPhaseComponent().name)
		#getCurrentPhaseComponent().run()


func initDelay():
	
	if spawnComponent != null:
		spawnComponent.name = "spawn"
		delaysOfPhase.append(spawnComponent.delay)
	else:
		delaysOfPhase.append(0)
	
	
	if onsetComponent != null:
		onsetComponent.name = "onset"
		delaysOfPhase.append(onsetComponent.delay)
	else:
		delaysOfPhase.append(0)
	
	
	if hitComponent != null:
		hitComponent.name = "hit"
		delaysOfPhase.append(hitComponent.delay)
	else:
		delaysOfPhase.append(0)
	
	
	if offsetComponent != null:
		offsetComponent.name = "offset"
		delaysOfPhase.append(offsetComponent.delay)
	else:
		delaysOfPhase.append(0)



func setSpecificComp(comp:EffectTComponent, intOfT:int):
	match intOfT:
		0:
			spawnComponent = comp
		1:
			onsetComponent = comp
		2:
			hitComponent = comp
		3:
			offsetComponent = comp

