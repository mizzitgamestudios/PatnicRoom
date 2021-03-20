extends Node
class_name _007_Create_NPC_Process


#----- MAIN ------------------------------------------------------------------##

var specialtyTemplate
var raceTemplate
var roleTemplate

#BOOKMARK[epic=Entities_Process] Actor Dictionary -> ActorEntity 
func createNPC(dictionary:Dictionary):
	getMainTemplates(dictionary)
	var ent = ActorEntity.new()
	
	_addBasicDefinitionTemplates(ent)
	_addSynonym(ent)
	
	_addDirectStats(ent)
	
	_addIndirectStats(ent,dictionary)

	return ent


func getMainTemplates(dictionary:Dictionary):
	pass
	raceTemplate = API_017_Atlas.getRaces().atlas_Entry[dictionary["C_11_ACTOR_RACE_NAME"]]
	roleTemplate = API_017_Atlas.getRoles().atlas_Entry[dictionary["C_13_ACTOR_ROLE_NAME"]]
	specialtyTemplate = API_017_Atlas.getSpecialty().atlas_Entry[dictionary["C_14_ACTOR_SPECIALTY_NAME"]]



#----- BASIC -----------------------------------------------------------------##

func _addBasicDefinitionTemplates(ent):
	ent.addTemplate("race",raceTemplate)
	ent.addTemplate("role",roleTemplate)
	ent.addTemplate("specialty",specialtyTemplate)


func _addDirectStats(ent):
	_getAttributeBlock(ent)
	_getSkillBlock(ent)


func _addSynonym(ent):
	var synonymComponent = roleTemplate.getComp(C_47_ANY_SYNONYM.name_quack())
	var randomNumber = Util.RNG.getRandomNumber(0,synonymComponent.value.size()-1)
	var synonym = synonymComponent.value[randomNumber]
	
	ent.addComponent(C_47_ANY_SYNONYM.new(synonym)) 



#----- DIRECT STATS ----------------------------------------------------------##

func _getAttributeBlock(ent):
	var attributesOfRace = ent.getCompTempValue("race","C_19_ACTOR_ATTRIBUTES")
	var attributesOfRole = ent.getCompTempValue("role","C_19_ACTOR_ATTRIBUTES")

	var attributesSum  = Util.DictionaryUtils.use(attributesOfRace,"increment",attributesOfRole)
	ent.addComponent(C_19_ACTOR_ATTRIBUTES.new(attributesSum))


func _getSkillBlock(ent):
	var skillOfSpecialty = ent.getCompTempValue("specialty","C_20_ACTOR_SKILLBLOCK")
	var skillOfRole = ent.getCompTempValue("role","C_20_ACTOR_SKILLBLOCK")

	var skillSum  = Util.DictionaryUtils.use(skillOfSpecialty,"increment",skillOfRole)
	
	var skillcomp = C_20_ACTOR_SKILLBLOCK.new()
	skillcomp.setSkillblock(skillSum)
	ent.addComponent(skillcomp)


#----- INDIRECT STATS --------------------------------------------------------##

func _addIndirectStats(ent,dictionary):
	var comp = C_26_ACTOR_INDIRECT_STATS.new(ent.getComp(C_19_ACTOR_ATTRIBUTES.name_quack()), ent)
	ent.addComponent(C_2_ANY_TEXTURE_ID.new(dictionary["C_6_TILE_NAME"]))
	ent.addComponent(C_21_TILE_TILENAME.new(dictionary["C_6_TILE_NAME"]))
