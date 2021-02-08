###############################################################################################################################
#                                                                                                                             #
# Klasse:		CreateNPC                                                                                                     #
# description:	Generates diffrent types of NPC who can act on a Tilemap,RNG and predifned JSON as well                       #
#                                                                                                                             #
# data flow:	External JSON -> Tilemap(ActorLayer)                                                                          #
# often called:	N/A                                                                                                           #
#                                                                                                                             #
###############################################################################################################################

extends Node
class_name _007_Create_NPC_Process



########################
# --- Variables ------ #
########################
var specialtyTemplate
var raceTemplate
var roleTemplate


########################
# --- Main ----------- #
########################
func createNPC(dictionary:Dictionary):
	getMainTemplates(dictionary)
	
	var ent = ActorEntity.new()
	
	_addBasicDefinitionTemplates(ent)
	_addSynonym(ent)
	_addDirectStats(ent)
	
	var indirectStats = Comp_NPC_IndirectStats.new(ent)
	ent.indirectStats = indirectStats
	ent.position = Comp_Actor_Position.new(Vector2(dictionary["posX"],dictionary["posY"]))
	ent.tileName = Comp_NPC_TileName.new(dictionary["tileName"])
	ent.textureID = ent.tileName
	return ent


func getMainTemplates(dictionary:Dictionary):
	raceTemplate = DemokrECTS.groupManager.atlas_Races.entitiesInGroup[dictionary["race"]]
	roleTemplate = DemokrECTS.groupManager.atlas_Roles.entitiesInGroup[dictionary["role"]]
	specialtyTemplate = DemokrECTS.groupManager.atlas_Specialties.entitiesInGroup[dictionary["specialty"]]



########################
# --- Basic Definition #
########################
func _addBasicDefinitionTemplates(ent):
	ent.addTemplate("race",raceTemplate)
	ent.addTemplate("role",roleTemplate)
	ent.addTemplate("specialty",specialtyTemplate)


func _addDirectStats(ent):
	_getAttributeBlock(ent)
	_getSkillBlock(ent)


func _addSynonym(ent):
	var synonymComponent = roleTemplate.getComponent("Comp_NPC_Synonym")
	var randomNumber = Util.RNG.getRandomNumber(0,synonymComponent.value.size()-1)
	
	var synonym = synonymComponent.value[randomNumber]
	
	ent.synonym = Comp_NPC_Synonym.new(synonym)



########################
# --- Direct Stats --- #
########################
func _getAttributeBlock(ent):
		var attributesOfRace = ent.getComponentValueOfTemplate("race","Comp_Actor_Attributes")
		var attributesOfRole = ent.getComponentValueOfTemplate("role","Comp_Actor_Attributes")
	
		var attributesSum  = Util.DictionaryUtils.use(attributesOfRace,"increment",attributesOfRole)
		ent.attributes = Comp_Actor_Attributes.new(attributesSum)

func _getSkillBlock(ent):
		var skillOfSpecialty = ent.getComponentValueOfTemplate("specialty","Comp_NPC_SkillBlock")
		var skillOfRole = ent.getComponentValueOfTemplate("role","Comp_NPC_SkillBlock")

		var skillSum  = Util.DictionaryUtils.use(skillOfSpecialty,"increment",skillOfRole)
		
		var skillcomp = Comp_NPC_SkillBlock.new()
		skillcomp.setSkillblock(skillSum)
		ent.skills = skillcomp
