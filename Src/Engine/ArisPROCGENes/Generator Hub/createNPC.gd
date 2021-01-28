extends Node
class_name CreateNPCProcess

var specialtyTemplate
var raceTemplate
var roleTemplate

func createNPC(dictionary):
	var tileName = Comp_NPC_TileName.new(dictionary["tileName"])

	specialtyTemplate = DemokrECTS.EntitiesAttributes["ET-Specialty"]["allTemplateEntries"][dictionary["specialty"]]
	raceTemplate = DemokrECTS.EntitiesAttributes["ET-Race"]["allTemplateEntries"][dictionary["race"]]
	roleTemplate = DemokrECTS.EntitiesAttributes["ET-Role"]["allTemplateEntries"][dictionary["role"]]

	var ent = Entity.new()
	ent.add_component(tileName)

	_addBasicDefinitionTemplates(ent) #no perks
	_addSynonym(ent)
	_addDirectStats(ent)

	var indirectStatsTemplate=Comp_NPC_IndirectStats.new(ent)
	ent.addTemplate("indirectStats",indirectStatsTemplate)

	return ent


func _addBasicDefinitionTemplates(ent):
	var testAttributes = raceTemplate.getComponent("Comp_Actor_Attributes")


	ent.addTemplate("race",raceTemplate)
	ent.addTemplate("role",roleTemplate)
	ent.addTemplate("specialty",specialtyTemplate)

func _addDirectStats(ent):
	_getAttributeBlock(ent)
	_getSkillBlock(ent)


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


func _addSynonym(ent):
	var synonym = getRoleSynonym( roleTemplate.getComponent("Comp_NPC_Synonym"))
	ent.add_component(Comp_NPC_Synonym.new(synonym))


func getRoleSynonym(synonymList):
	var randomNumber = Util.RNG.getRandomNumber(0,synonymList.value.size()-1)
	return synonymList.value[randomNumber]
