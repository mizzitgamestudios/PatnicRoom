extends Component
class_name Comp_NPC_IndirectStats

var attributesBlock

var hitpoints
var condition

var carriageCapacity

var physicalLimit
var socialLimit
var mentalLimit


func _init(entPara):	
	return updateStats(entPara)


func updateStats(entPara):
	var ent = Entity.new()
	if entPara is ActorEntity or entPara.playerName != null:
		attributesBlock = entPara.attributes
	
	elif entPara is Entity:
		attributesBlock = entPara.getComponent("Comp_Actor_Attributes")
	else:
		attributesBlock = entPara
	
	hitpoints = 8+(attributesBlock.constitution.value/3)
	ent.add_component( Comp_Actor_Condition.new(hitpoints) )
	
	carriageCapacity = attributesBlock.strength.value + (attributesBlock.constitution.value  * 2)
	ent.add_component( Comp_Actor_Carriage.new(carriageCapacity) )
	
	physicalLimit    = (attributesBlock.constitution.value  +attributesBlock.reaction.value   +(attributesBlock.strength.value  * 2))  / 3
	socialLimit      = (attributesBlock.constitution.value  +attributesBlock.intuition.value  +(attributesBlock.charisma.value  * 2))  / 3
	mentalLimit      = (attributesBlock.willpower.value     +attributesBlock.intuition.value  +(attributesBlock.logic.value     * 2))  / 3
	ent.add_component( Comp_Actor_AllLimits.new(physicalLimit, socialLimit, mentalLimit) )
	
	return ent

