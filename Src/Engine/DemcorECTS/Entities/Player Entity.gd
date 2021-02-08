###############################################################################################################################
#                                                                                                                             #
# Klasse:		TileEntity                                                                                                    #
# description:	Basic class for Tilemap representation,includes Signal for broadcasts                                         #
#                                                                                                                             #
# data flow:	                                                                                                              #
# often called:	N/A                                                                                                           #
#                                                                                                                             #
###############################################################################################################################

extends Entity
class_name PlayerEntity

# Generall
var playerName: Component
var streetName: Component
var description:Component

# Stats
var attributes: Comp_Actor_Attributes
var skills: Comp_NPC_SkillBlock
var indirectStats : Comp_NPC_IndirectStats

# Spacial
var position: Component
var percievedLayer: Component
var textureID: Component

# Possesion
var kitsSets: KitventoryEntity
var inventory: GearEntity


################################################################################
##  --- Getter ---                                                            ##
################################################################################

# generall
func playerName() -> int:
	return playerName.value
func streetName() -> String:
	return streetName.value
func description() -> bool:
	return description.value

# attributes
func agillity():
	return attributes.agillity.value
func reaction():
	return attributes.reaction.value
func constitution():
	return attributes.constitution.value
func logic():
	return attributes.logic.value

func strength():
	return attributes.strength.value
func intuition():
	return attributes.intuition.value
func charisma():
	return attributes.charisma.value
func willpower():
	return attributes.willpower.value

# skills
func skills(skillname):
	return skills.value[skillname]


# indirect stats
func hitpoints():
	return indirectStats.hitpoints.value
func carriageCapacity():
	return indirectStats.carriageCapacity
func mentalLimit():
	return indirectStats.mentalLimit
func physicalLimit():
	return indirectStats.physicalLimit
func socialLimit():
	return indirectStats.socialLimit


func _init() -> void:
	streetName = Comp_Player_Streetname.new("the unkown")
	textureID = Comp_Tile_TextureID.new("General_0_5")
	position = Comp_Actor_Position.new(Vector2(0,0))
	percievedLayer = Comp_Actor_PerceivedLayer.new(ENUM.M_TYPES.MEAT)
	kitsSets = KitventoryEntity.new()


