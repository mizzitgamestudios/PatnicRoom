extends Component
class_name C_26_ACTOR_INDIRECT_STATS

var attributesBlock

var hitpoints
var condition

var carriageCapacity

var physicalLimit
var socialLimit
var mentalLimit


func _init(entPara):
	name = "C_26_ACTOR_INDIRECT_STATS"
	var preloadEnt = load("res://Src/Cogsmos Framework/DemcorECTS/Entities/Actor Entity.gd")
	return updateStats(entPara,preloadEnt)


func updateStats(entPara,preloadEnt):
	var ent = Entity.new()
#	if entPara is preloadEnt or entPara.playerName != null:
#		attributesBlock = entPara.getComp(C_19_ACTOR_ATTRIBUTES.name_quack())
#
#	elif entPara is Entity:
#		attributesBlock = entPara.getComp(COMP.ATLAS_INDEX_COMP.C_0_ANY_DESCRIPTION)
#	else:
#		attributesBlock = entPara.getComp(C_19_ACTOR_ATTRIBUTES.name_quack())
#	attributesBlock = entPara.getComp(C_19_ACTOR_ATTRIBUTES.name_quack())
	attributesBlock=entPara
	hitpoints = 8+(attributesBlock.constitution.value/3)
	ent.addComponent( C_24_ANY_CONDITION.new(hitpoints) )
	
	carriageCapacity = attributesBlock.strength.value + (attributesBlock.constitution.value  * 2)
	ent.addComponent( C_23_ACTOR_CARRIAGE.new(carriageCapacity) )
	
	physicalLimit    = (attributesBlock.constitution.value  +attributesBlock.reaction.value   +(attributesBlock.strength.value  * 2))  / 3
	socialLimit      = (attributesBlock.constitution.value  +attributesBlock.intuition.value  +(attributesBlock.charisma.value  * 2))  / 3
	mentalLimit      = (attributesBlock.willpower.value     +attributesBlock.intuition.value  +(attributesBlock.logic.value     * 2))  / 3
	ent.addComponent( C_22_ACTOR_LIMITS.new(physicalLimit, socialLimit, mentalLimit) )
	
	return ent

static func name_quack():
	return "C_26_ACTOR_INDIRECT_STATS"
