extends Node
class_name DynamicNPC


var tileName: String
var position: Vector2
var synonym: Comp_NPC_Synonym
var attributes: Comp_Actor_Attributes
var skills: Comp_NPC_SkillBlock
var indirectStats : Entity

func _init(positionPara,dict):
	var ent: Entity = ArisPROCGENes.createNPCProcess.createNPC(dict)
	
	tileName = ent.getComponent("Comp_NPC_TileName").value
	position = positionPara
	synonym = ent.getComponent("Comp_NPC_Synonym")
	attributes = ent.getComponent("Comp_Actor_Attributes")
	skills = ent.getComponent("Comp_NPC_SkillBlock")
	indirectStats = ent.dictOfTemplates["indirectStats"]
	

func getSynonym():
	synonym.value

func getAttributes():
	return skills.value
	
func getSkill(skillName):
	return skills[skillName]
	
func getSkills():
	return skills.value
	
func getHitpoints():
	return indirectStats.hitpoints
	
func getCarriageCapacity():
	return indirectStats.capacity

func getPhysicalLimit():
	return indirectStats.physicalLimit

func getSocialLimit():
	return indirectStats.socialLimit
	
func getMentalLimit():
	return indirectStats.mentalLimit
