extends Entity
class_name PlayerEntity


var position : Vector2




# generall
func playerName() 					-> int:				return .getCompValue(C_45_PLAYER_NAME.name_quack())
func textureID()					-> String:			return .getCompValue(C_2_ANY_TEXTURE_ID.name_quack())
func description() 					-> bool:			return .getCompValue(C_0_ANY_DESCRIPTION.name_quack())
func streetName() 					-> String:			return .getCompValue(C_44_PLAYER_STREETNAME.name_quack())
func getKitOfKitset(numberInKitset) -> KitSetEntity: 	return .getComp(C_51_PLAYER_KITSETS.name_quack()).getKitSetByLevel(numberInKitset)
func kitset() 						-> KitSetEntity: 	return .getComp(C_51_PLAYER_KITSETS.name_quack())


# attributes 
func logic() 						-> int:				return .getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).logic.value
func agillity() 					-> int:				return .getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).agillity.value
func reaction() 					-> int:				return .getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).reaction.value
func constitution() 				-> int:				return .getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).constitution.value

func strength() 					-> int:				return .getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).strength.value
func intuition() 					-> int:				return .getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).intuition.value
func charisma() 				 	-> int:				return .getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).charisma.value
func willpower()  					-> int:				return .getCompValue(C_19_ACTOR_ATTRIBUTES.name_quack()).willpower.value

# skills
func skills(skillname) 				-> int: 			return .getCompValue(C_20_ACTOR_SKILLBLOCK).value[skillname]


# indirect stats
func hitpoints() 					-> int:				return .getCompValue(C_26_ACTOR_INDIRECT_STATS.name_quack()).hitpoints.value
func carriageCapacity() 			-> int:				return .getCompValue(C_26_ACTOR_INDIRECT_STATS.name_quack()).carriageCapacity
func mentalLimit() 					-> int:				return .getCompValue(C_26_ACTOR_INDIRECT_STATS.name_quack()).mentalLimit
func physicalLimit() 				-> int:				return .getCompValue(C_26_ACTOR_INDIRECT_STATS.name_quack()).physicalLimit
func socialLimit() 					-> int:				return .getCompValue(C_26_ACTOR_INDIRECT_STATS.name_quack()).socialLimit

func setPos(positionPara:Vector2):     position = positionPara

func pos(): return position()
func position() 					-> Vector2:		return position
func posX()							-> int:         return int(position.x)
func posY()							-> int:			return int(position.y)



func _init() -> void:
	position = Vector2(0,0)
	addComponent(C_51_PLAYER_KITSETS.new())
	addComponent(C_2_ANY_TEXTURE_ID.new("General_0_5"))
	addComponent(C_44_PLAYER_STREETNAME.new("the unkown"))


