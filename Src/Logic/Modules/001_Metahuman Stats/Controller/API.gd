extends DemocrECTS_Controller


#----- INITIALICER ---------------------------------------------------------------##

var basicStatChange : _2_BasicStatChange


func _init():
	basicStatChange = _2_BasicStatChange.new()



#----- GETTER ---------------------------------------------------------------##
	
#FUNC for player,you can use [changePlayerStat()] 
func changeStat(playerEnt_actorEnt,compOfEnt,mod):
	if ENUM.hasEnum(ENUM.ATTRIBUTES,compOfEnt):
		mod = int(mod)

		basicStatChange.changeStat(playerEnt_actorEnt,compOfEnt,mod)



func changePlayerStat(compOfEnt,mod):
	changeStat(API_011_Player.currentChar,compOfEnt,mod)



func contextualEntityGeneration_quack(dict_or_ent):
	if   dict_or_ent.hasFlag("F_10_ACTOR_ATTRIBUTES_ROLES"): 			       API_017_Atlas.getRoles().addEntity(dict_or_ent)
	elif dict_or_ent.hasFlag("F_11_ACTOR_ATTRIBUTES_RACE"):	       API_017_Atlas.getRaces().addEntity(dict_or_ent)
	elif dict_or_ent.hasFlag("F_7_ACTOR_ATTRIBUTES_SPECIALTY"):            API_017_Atlas.getSpecialty().addEntity(dict_or_ent)




		
