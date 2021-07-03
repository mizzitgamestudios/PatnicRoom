
# CLASS                                                                              
# DOCS  https://mizzitgamestudios.github.io/mkDocs/site/Entities/player/             
# CLASS                                                                              
# BOOKMARK[epic=Entities_Core] Player                                                
extends Entity
class_name PlayerEntity


# ----- INITIALICE ----------------------------------------------------------- ##

var position      : Vector2

var inventory     : CommonInventory
var kitventory    : Kitventory
var stats         : Stats


func _init() -> void:
	#>>> Default <<<#
	position   = Vector2(0,0)
	addComponent(C_51_PLAYER_KITSETS.new())
	addComponent(C_2_ANY_TEXTURE_ID.new("General_0_5"))
	addComponent(C_44_PLAYER_STREETNAME.new("the unkown"))
	
	
	#>>> Systems <<<#
	stats      = Stats.new()
	kitventory = Kitventory.new()
	inventory  = CommonInventory.new()
	
	


 
# ----- GETTER --------------------------------------------------------------- ##


#>>> Generall <<<#

func playerName() 					-> int:				return .getCompValue(C_45_PLAYER_NAME.name_quack())
func textureID()					-> String:			return .getCompValue(C_2_ANY_TEXTURE_ID.name_quack())
func description() 					-> bool:			return .getCompValue(C_0_ANY_DESCRIPTION.name_quack())
func streetName() 					-> String:			return .getCompValue(C_44_PLAYER_STREETNAME.name_quack())
func mouseHover_quack()             -> String:          return "player"


#>>> Position <<<#

func pos()                          -> Vector2:  		return position
func posX()							-> int:         	return int(position.x)
func posY()							-> int:				return int(position.y)



# ----- SETTER --------------------------------------------------------------- ##


func setPos(positionPara:Vector2):     position = positionPara



# ----- COMMON INVENTORY ----------------------------------------------------- ##

func getCredits()					-> int:			return inventory.getCredits()



# ----- KITVENTORY ----------------------------------------------------------- ##


func getGearedKitSetByNr(nr)  				-> KitSetEntity: 		return kitventory.getGearedKitSetByNr(nr)
func getGearedKitSetByString(string)  		-> KitSetEntity: 		return kitventory.getGearedKitSetByString(string)

func getGearedKitventoryByNr(nr)  			-> KitSetEntity: 		return kitventory.getGearedKitventoryByNr(nr)
func getGearedKitventoryByString(string)  	-> KitSetEntity: 		return kitventory.getGearedKitventoryByString(string)

func removeGearedKitSet(kitset)  	-> void: 		kitventory.removeGearedKitSet(kitset)
func appendGearedKitSet(kitset)  	-> void: 		kitventory.appendGearedKitSet(kitset)

func removeKitventory(kitset)  		-> void: 		kitventory.removeKitventory(kitset)
func appendKitventory(kitset)  		-> void: 		kitventory.appendKitventory(kitset)


func swapKitsetIntoGear(kitset)  		-> void: 	kitventory.swapKitsetIntoGear(kitset)
func swapKitsetIntoGearNr(kitset)  		-> void: 	kitventory.swapKitsetIntoGearNr(kitset)

func swapKitsetIntoKitventory(kitset)  	-> void: 	kitventory.swapKitsetIntoKitventory(kitset)
func swapKitsetIntoKitventoryNr(kitset)	-> void: 	kitventory.swapKitsetIntoKitventoryNr(kitset)



# ----- STATS ---------------------------------------------------------------- ##

 
#>>> Attributes <<<#

func logic() 					-> int:			return stats.logic()
func agillity() 				-> int:			return stats.agillity()
func reaction() 				-> int:			return stats.reaction()
func constitution() 			-> int:			return stats.constitution()

func strength() 				-> int:			return stats.strength()
func intuition() 				-> int:			return stats.intuition()
func charisma() 				-> int:			return stats.charisma()
func willpower()  				-> int:			return stats.willpower()


#>>> Skills <<<#

func skillCrafting() 			-> int: 		return stats.skills(ENUM.SKILL.CRAFTING)
func skillPhylosophizing() 		-> int: 		return stats.skills(ENUM.SKILL.PHYLOSOPHIZING)
func skillConceptualizing() 	-> int: 		return stats.skills(ENUM.SKILL.CONCEPTUALICING)

func skillPercecving() 			-> int: 		return stats.skills(ENUM.SKILL.PERCEVING)
func skillAssensing() 			-> int: 		return stats.skills(ENUM.SKILL.ASSENSING)
func skillDebugging() 			-> int: 		return stats.skills(ENUM.SKILL.DEBUGGING)

func skillEnduring() 			-> int: 		return stats.skills(ENUM.SKILL.ENDURING)
func skillCoping() 				-> int: 		return stats.skills(ENUM.SKILL.COPING)
func skillFiltering()		 	-> int: 		return stats.skills(ENUM.SKILL.FILTERING)

func skillSneaking() 			-> int: 		return stats.skills(ENUM.SKILL.SNEAKING)
func skillRepressing() 			-> int: 		return stats.skills(ENUM.SKILL.REPRESSING)
func skillSilencing() 			-> int: 		return stats.skills(ENUM.SKILL.SILENCING)


#>>> Indirect <<<# 

func hitpoints() 				-> int:			return stats.hitpoints()
func carriageCapacity() 		-> int:			return stats.carriageCapacity()

func mentalLimit() 				-> int:			return stats.mentalLimit()
func physicalLimit() 			-> int:			return stats.physicalLimit()
func socialLimit() 				-> int:			return stats.socialLimit()







