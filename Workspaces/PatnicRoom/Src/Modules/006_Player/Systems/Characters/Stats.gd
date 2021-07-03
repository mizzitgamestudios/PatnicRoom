extends Component
class_name Stats


var playerEntity


func initialice(playerEntityPara):
	playerEntity = playerEntityPara




# --- attributes --- #


func logic() 			-> int:				return playerEntity.getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).logic.value
func agillity() 		-> int:				return playerEntity.getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).agillity.value
func reaction() 		-> int:				return playerEntity.getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).reaction.value
func constitution() 	-> int:				return playerEntity.getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).constitution.value

func strength() 		-> int:				return playerEntity.getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).strength.value
func intuition() 		-> int:				return playerEntity.getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).intuition.value
func charisma() 		-> int:				return playerEntity.getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).charisma.value
func willpower()  		-> int:				return playerEntity.getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).willpower.value



# --- skills --- #


func skills(skillname) 			-> int: 		return playerEntity.getCompValue(C_20_ACTOR_SKILLBLOCK).value[skillname]



# --- indirect stats --- #


func hitpoints() 		-> int:				return playerEntity.getCompValue(C_26_ACTOR_INDIRECT_STATS.name_quack()).hitpoints.value
func carriageCapacity() -> int:				return playerEntity.getCompValue(C_26_ACTOR_INDIRECT_STATS.name_quack()).carriageCapacity
func mentalLimit() 		-> int:				return playerEntity.getCompValue(C_26_ACTOR_INDIRECT_STATS.name_quack()).mentalLimit
func physicalLimit() 	-> int:				return playerEntity.getCompValue(C_26_ACTOR_INDIRECT_STATS.name_quack()).physicalLimit
func socialLimit() 		-> int:				return playerEntity.getCompValue(C_26_ACTOR_INDIRECT_STATS.name_quack()).socialLimit






