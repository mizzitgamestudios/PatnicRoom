extends Object
class_name _2_BasicStatChange


func changeStat(playerEnt_actorEnt,compOfEntEnum,mod):
	var compOfAttribute

	if ENUM.has(ENUM.ATTRIBUTES,compOfEntEnum):
		compOfAttribute = getAttributeComp(playerEnt_actorEnt,compOfEntEnum)

	elif ENUM.has(ENUM.INDIRECT_STATS,compOfEntEnum):
		compOfAttribute = getIndirectStatsComp(playerEnt_actorEnt,compOfEntEnum)

	compOfAttribute -= mod




	


func getAttributeComp(playerEnt_actorEnt,compOfEntEnum):
	match compOfEntEnum:
		ENUM.ATTRIBUTES.LOGIC : return playerEnt_actorEnt.logic()
		ENUM.ATTRIBUTES.AGILLITY : return playerEnt_actorEnt.agillity()
		ENUM.ATTRIBUTES.STRENGTH : return playerEnt_actorEnt.strength()
		ENUM.ATTRIBUTES.REACTION : return playerEnt_actorEnt.reaction()
		ENUM.ATTRIBUTES.CHARISMA : return playerEnt_actorEnt.charisma()
		ENUM.ATTRIBUTES.INTUITION : return playerEnt_actorEnt.intuition()
		ENUM.ATTRIBUTES.WILLPOWER : return playerEnt_actorEnt.willpower()
		ENUM.ATTRIBUTES.CONSTITUTION: return playerEnt_actorEnt.constitution()



func getIndirectStatsComp(playerEnt_actorEnt,compOfEntEnum):
	match compOfEntEnum:
		ENUM.ATTRIBUTES.HITPOINTS : return playerEnt_actorEnt.hitpoints()
		ENUM.ATTRIBUTES.CONDITION : return playerEnt_actorEnt.condition()
		ENUM.ATTRIBUTES.SOCIALLIMIT : return playerEnt_actorEnt.socialLimit()
		ENUM.ATTRIBUTES.MENTALLIMIT : return playerEnt_actorEnt.mentalLimit()
		ENUM.ATTRIBUTES.PHYSICALLIMIT : return playerEnt_actorEnt.physicalLimit()
		ENUM.ATTRIBUTES.CARRIAGECAPACITY : return playerEnt_actorEnt.carriageCapacity()



