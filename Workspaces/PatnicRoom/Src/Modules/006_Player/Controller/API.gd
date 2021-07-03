extends DemocrECTS_Controller


# BOOKMARK[epic=Modules] 006_Player                                              
# ----- INITIALICE ----------------------------------------------------------- ##


var currentChar       := PlayerEntity.new()
var _011_in           := _011_In.new()

var _011_charloader   := _011_CharLoader.new()
var _011_chargen      := _011_Chargen.new()


var cloudPrinter      := Cloudprinter.new()
var recycler          := Recycler.new()
var stations          := Stations.new()

var chargenSelecttion : Dictionary
var team              := Team.new()

var inputMode = true


func _ready() -> void:
	_011_Utils.generateCharPreset()



# ----- GETTER --------------------------------------------------------------- ##

func getInputMode():                        return inputMode
func getStations(): return stations
func getCurrentStation(): return stations.currentStation


# ----- SELECTED TILES ------------------------------------------------------- ##


func getSelectedTiles():                    return currentChar.getCompValue(C_53_Actor_SELECTED_TILE.name_quack())
func getSelectedTilesComp():                return currentChar.getComp(C_53_Actor_SELECTED_TILE.name_quack())

func resetSelectedTiles():                  currentChar.getComp(C_53_Actor_SELECTED_TILE.name_quack()).reset()
func appendSelectedTiles(arr):              currentChar.getComp(C_53_Actor_SELECTED_TILE.name_quack()).addToCache(arr)
func appendSelectedTilesCacheIntoPerma():   currentChar.getComp(C_53_Actor_SELECTED_TILE.name_quack()).appendCacheIntoPerma()



# ----- CHARACTER ------------------------------------------------------------ ##


func setCurrentCharByDict(dict:Dictionary):   _011_charloader.setCurrentCharByDict(dict)
func generateNewChar():                       _011_chargen.generateNewChar()



# ----- CURRENT CHAR PROXY --------------------------------------------------- ##

 
#>>> Attributes <<<#

func logic() 							-> int:		return currentChar.logic()
func agillity() 						-> int:		return currentChar.agillity()
func reaction() 						-> int:		return currentChar.reaction()
func constitution() 					-> int:		return currentChar.constitution()

func strength() 						-> int:		return currentChar.strength()
func intuition() 						-> int:		return currentChar.intuition()
func charisma() 						-> int:		return currentChar.charisma()
func willpower()  						-> int:		return currentChar.willpower()


#>>> Skills <<<#

func skillCrafting() 					-> int: 	return currentChar.skills(ENUM.SKILL.CRAFTING)
func skillPhylosophizing() 				-> int: 	return currentChar.skills(ENUM.SKILL.PHYLOSOPHIZING)
func skillConceptualizing() 			-> int: 	return currentChar.skills(ENUM.SKILL.CONCEPTUALICING)

func skillPercecving() 					-> int: 	return currentChar.skills(ENUM.SKILL.PERCEVING)
func skillAssensing() 					-> int: 	return currentChar.skills(ENUM.SKILL.ASSENSING)
func skillDebugging() 					-> int: 	return currentChar.skills(ENUM.SKILL.DEBUGGING)

func skillEnduring() 					-> int: 	return currentChar.skills(ENUM.SKILL.ENDURING)
func skillCoping() 						-> int: 	return currentChar.skills(ENUM.SKILL.COPING)
func skillFiltering()				 	-> int:		return currentChar.skills(ENUM.SKILL.FILTERING)

func skillSneaking() 					-> int: 	return currentChar.skills(ENUM.SKILL.SNEAKING)
func skillRepressing() 					-> int: 	return currentChar.skills(ENUM.SKILL.REPRESSING)
func skillSilencing() 					-> int: 	return currentChar.skills(ENUM.SKILL.SILENCING)


#>>> Indirect <<<# 

func hitpoints() 						-> int:		return currentChar.hitpoints()
func carriageCapacity() 				-> int:		return currentChar.carriageCapacity()

func mentalLimit() 						-> int:		return currentChar.mentalLimit()
func physicalLimit() 					-> int:		return currentChar.physicalLimit()
func socialLimit() 						-> int:		return currentChar.socialLimit()


#>>> Inventory <<<# 

func getCredits()						-> int:		return currentChar.getCredits()


#>>> KitSets <<<# 

# getter
func getGearedKitSetByNr(nr)  				-> KitSetEntity: 		return currentChar.getGearedKitSetByNr(nr)
func getGearedKitSetByString(string)  		-> KitSetEntity: 		return currentChar.getGearedKitSetByString(string)

func getGearedKitventoryByNr(nr)  			-> KitSetEntity: 		return currentChar.getGearedKitventoryByNr(nr)
func getGearedKitventoryByString(string)  	-> KitSetEntity: 		return currentChar.getGearedKitventoryByString(string)


# add and remove
func removeGearedKitSet(kitset)  			-> void: 				currentChar.removeGearedKitSet(kitset)
func appendGearedKitSet(kitset)  			-> void: 				currentChar.kitventory.appendGearedKitSet(kitset)

func removeKitventory(kitset)  				-> void: 				currentChar.removeKitventory(kitset)
func appendKitventory(kitset)  				-> void: 				currentChar.appendKitventory(kitset)


# swap
func swapKitsetIntoGear(kitset)  			-> void: 				currentChar.swapKitsetIntoGear(kitset)
func swapKitsetIntoGearNr(kitset)  			-> void: 				currentChar.swapKitsetIntoGearNr(kitset)

func swapKitsetIntoKitventory(kitset) 	 	-> void: 				currentChar.swapKitsetIntoKitventory(kitset)
func swapKitsetIntoKitventoryNr(kitset)		-> void: 				currentChar.swapKitsetIntoKitventoryNr(kitset)







