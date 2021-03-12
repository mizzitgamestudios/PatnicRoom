extends DemocrECTS_Controller


#----- INITIALICE ------------------------------------------------------------##

var atlasInteractable: Dictionary = {}
var _staticEntManager: _15_StaticInterManager


func _init() -> void:
	self.name = "API_000_BasicTileAtlas"
	atlasInteractable = self._dict_component_index
	_staticEntManager= _15_StaticInterManager.new("API_15_InteractableEntityManager", ENUM.MINIMAL_COMP_INTERACT_ENT)



#----- CREATORS --------------------------------------------------------------##

func contextualEntityGeneration_quack(dict):
	var ent = _staticEntManager.contextualEntityGeneration_quack(dict)
	API_017_Atlas.getInteractablesAtlas().addEntity(ent)
	return ent

func secureEntityGeneration_quack(dict):
	return secureEntityGeneration_quack(dict)




