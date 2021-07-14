extends Component
class_name Kitventory


var playerEntity
var gearedKitset : C_51_PLAYER_KITSETS
var kitventory   : C_68_KITVENTORY

func initialice(playerEntityPara):
	self.owner  = playerEntityPara
	gearedKitset  = playerEntityPara.getComp("C_51_PLAYER_KITSETS")
	kitventory    = playerEntityPara.getComp("C_68_KITVENTORY")



# ----- GETTER --------------------------------------------------------------- ##


func getGearedKitSetByNr(nr)  				-> KitSetEntity: 		return gearedKitset.getKitSetByLevel(nr)
func getGearedKitSetByString(string)  		-> KitSetEntity: 		return gearedKitset.getKitSetByString(string)

func getGearedKitventoryByNr(nr)  			-> KitSetEntity: 		return kitventory.getKitSetByNr(nr)
func getGearedKitventoryByString(string)  	-> KitSetEntity: 		return kitventory.getKitSetByString(string)




# ----- SETTER --------------------------------------------------------------- ##


func removeGearedKitSet(kitset)  	-> void: 		gearedKitset.remove(kitset)
func appendGearedKitSet(kitset)  	-> void: 		gearedKitset.addKitSet(kitset)

func removeKitventory(kitset)  		-> void: 		kitventory.remove(kitset)
func appendKitventory(kitset)  		-> void: 		kitventory.addKitSet(kitset)


func swapKitsetIntoGear(kitset)  		-> void: 	_exchangeKitset(kitset,kitventory,gearedKitset)
func swapKitsetIntoGearNr(kitset)  		-> void: 	_exchangeKitset(kitset,kitventory,gearedKitset)

func swapKitsetIntoKitventory(kitset)  	-> void: 	_exchangeKitset(kitset,gearedKitset,kitventory)
func swapKitsetIntoKitventoryNr(kitset)	-> void: 	_exchangeKitset(kitset,gearedKitset,kitventory)



# ----- PROCESS -------------------------------------------------------------- ##


func _exchangeKitset(kitset,fromArray,toArray):
	var cache = fromArray[kitset]
	fromArray.remove(kitset)
	toArray[kitset] = cache












