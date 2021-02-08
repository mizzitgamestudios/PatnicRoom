extends Object
class_name _05_runEffect

#Signals.connect("Effect_Turn",self,"decrementDelay")

var delaysOfPhase:Array
var phases

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





var playerpos
func runEffect(effect:EffectEntity,direction):
	playerpos = API_009_Tilemap.getPlayerPos()
	Signals.connect("Effect_Turn",self,"decrementDelay")
	#effect.initDelay()
	phases = [effect.spawnComponent,effect.onsetComponent,effect.hitComponent,effect.offsetComponent]
	if effect.spawnComponent != null:
		runSpawnComponent(direction)
	
	elif effect.onsetComponent != null:
		runOnsetComponent(direction)
	
	elif effect.hitComponent != null:
		runHitComponent(direction)
	
	elif effect.offsetComponent != null:
		runOffsetComponent(direction)
	
	
	
	
	
func runSpawnComponent(direction):
	pass

func runOnsetComponent(direction):
	direction = direction.to_lower()
	var pos = API_009_Tilemap.getPlayerPos()
	var maxReach = phases[1].spaceObject.reach
	
	for i in maxReach:
		
		var end
		if direction=="a":
			end = Vector2(pos.x+i+1,pos.y)
		if direction=="d":
			end = Vector2(pos.x-i+1,pos.y)
	
		if direction=="w":
			end = Vector2(pos.x,pos.y-i+1)
		if direction=="s":
			end = Vector2(pos.x,pos.y+i+1)
	
		var vals = SokraTiles.Actors_on_map.values()
	
		for j in vals.size():
			var currentEnt:ActorEntity = vals[j]
			var test = currentEnt.position.value
			
			if end.x == test.x and end.y == test.y:
				API_009_Tilemap.actorLayer.clearTextureOfcurrentPos(currentEnt)
				currentEnt.free()
				return
	
	

	

func runOffsetComponent(direction):
	pass

func runHitComponent(direction):
	pass


