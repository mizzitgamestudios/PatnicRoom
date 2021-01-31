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
class_name CreateNPCProcess



########################
# --- Variables ------ #
########################
var specialtyTemplate
var raceTemplate
var roleTemplate
var tileName


########################
# --- Main ----------- #
########################
func createNPC(dictionary):

	getMainTemplates(dictionary)

	var ent = Entity.new()
	ent.add_component(tileName)

	_addBasicDefinitionTemplates(ent)
	_addSynonym(ent)
	_addDirectStats(ent)

	var indirectStatsTemplate = Comp_NPC_IndirectStats.new(ent)
	ent.addTemplate("indirectStats",indirectStatsTemplate)

	return ent


func getMainTemplates(dictionary:Dictionary):
	specialtyTemplate = DemokrECTS.EntitiesAttributes["ET-Specialty"]["allTemplateEntries"][dictionary["specialty"]]
	raceTemplate = DemokrECTS.EntitiesAttributes["ET-Race"]["allTemplateEntries"][dictionary["race"]]
	roleTemplate = DemokrECTS.EntitiesAttributes["ET-Role"]["allTemplateEntries"][dictionary["role"]]
	tileName = Comp_NPC_TileName.new(dictionary["tileName"])



########################
# --- Basic Definition #
########################
func _addBasicDefinitionTemplates(ent):
	var testAttributes = raceTemplate.getComponent("Comp_Actor_Attributes")

	ent.addTemplate("race",raceTemplate)
	ent.addTemplate("role",roleTemplate)
	ent.addTemplate("specialty",specialtyTemplate)


func _addDirectStats(ent):
	_getAttributeBlock(ent)
	_getSkillBlock(ent)

	
func _addSynonym(ent):
	var synonym = getRoleSynonym( roleTemplate.getComponent("Comp_NPC_Synonym"))
	ent.add_component(Comp_NPC_Synonym.new(synonym))

func getRoleSynonym(synonymList):
	var randomNumber = Util.RNG.getRandomNumber(0,synonymList.value.size()-1)
	return synonymList.value[randomNumber]



########################
# --- Direct Stats --- #
########################
func _getAttributeBlock(ent):
		var attributesOfRace = ent.getComponentValueOfTemplate("race","Comp_Actor_Attributes")
		var attributesOfRole = ent.getComponentValueOfTemplate("role","Comp_Actor_Attributes")
	
		var attributesSum  = Util.DictionaryUtils.use(attributesOfRace,"increment",attributesOfRole)
		ent.add_component(Comp_Actor_Attributes.new(attributesSum))
	
func _getSkillBlock(ent):
		var skillOfSpecialty = ent.getComponentValueOfTemplate("specialty","Comp_NPC_SkillBlock")
		var skillOfRole = ent.getComponentValueOfTemplate("role","Comp_NPC_SkillBlock")

		var skillSum  = Util.DictionaryUtils.use(skillOfSpecialty,"increment",skillOfRole)
		var skillcomp = Comp_NPC_SkillBlock.new()
		skillcomp.modAllSkills(skillSum)
		ent.add_component(skillcomp)