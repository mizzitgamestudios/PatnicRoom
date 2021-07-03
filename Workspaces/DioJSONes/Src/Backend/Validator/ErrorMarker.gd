extends Node
class_name Validator_Error_Marker


static func markErrors(mandatoryCompNotFilled,mandatoryEffectNotFilled):
	markGenrallComponents(mandatoryCompNotFilled)
	markEffectStats(mandatoryEffectNotFilled)



static func markGenrallComponents(mandatoryCompNotFilled):
	for entry in mandatoryCompNotFilled:
		for compClass in Parser.componentsAttributesClasses:
			
			if compClass.componentName == entry:
				compClass.inputNode.setDebugMode()


static func markEffectStats(mandatoryEffectNotFilled):
	for entry in mandatoryEffectNotFilled:
		var ifs = getInternalFields(entry)
		
		var sceneNode = getScene(ifs)
		var unitNode  = getUnitScene(ifs, sceneNode)
		var inputNode = getInputNode(ifs, unitNode)
		
		inputNode.setDebugMode()



static func getInternalFields(entry):
	var ifs = entry.split(":")
	return { "time":ifs[0], "unit":ifs[1], "stat":ifs[2] }



static func getScene(ifs): 
	return Parser.cachedEffectSet[ int(ifs["time"])-1 ].scene

static func getUnitScene(ifs,scene):
	match ifs["unit"]:
		"SPACE"   :	return scene.space
		"TRIGGER" : return scene.trigger
		"EFFECT"  : return scene.effect

static func getInputNode(ifs,unitNode):
	if ifs["unit"] == "SPACE"   : return getSpaceStat(unitNode, ifs["stat"])
	if ifs["unit"] == "TRIGGER" : return getTriggerStat(unitNode, ifs["stat"])
	if ifs["unit"] == "EFFECT"  : return getEffectStat(unitNode, ifs["stat"])
	if ifs["unit"] == "TIME"    : return unitNode.length





static func getSpaceStat(unitScene,stat):
	var spaceSlot  = ["REACH","MEDIUM","M_TYPE","SOURCE"]
	var spaceScene = [unitScene.reach,unitScene.medium,unitScene.mType,unitScene.source]
	
	for i in spaceScene.size():
		if stat == spaceSlot[i] : return spaceScene[i]


static func getTriggerStat(unitScene,stat):
	if stat == "BASE": 		return unitScene.basicTrigger
	if stat == "SPECIFIC": 	return unitScene.listOfSpecificTrigger[0]
	
static func getEffectStat(unitScene,stat):
	if stat == "X": return unitScene.listOfEffects[0]

