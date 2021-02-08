extends Node
class_name Effect_Generator_Simpel

var syntax = Effect_Generator_Syntax.new()


var effect
var trigger
var strOfattribute
var time
var space

func buildEffectProcess(dictOfProperties:Dictionary):
	var counter=-1
	var effectComp = EffectEntity.new()
	
	for effectByTime in syntax.LAYERS_OF_EFFECT:
		counter+=1
		
		for subEffect in syntax.LAYERS_OF_EFFECT:
			
			var baseID = syntax.EFFECT_STADIUM_BASE+str(effectByTime)+"-"
			var sequenzeID = syntax.EFFECT_STADIUM_OF_GENERATOR[subEffect]
#
			print(baseID+sequenzeID)
			
			if subEffect %3 ==0:
				skipMode=false
			
			if !skipMode:
				match sequenzeID:
					"SPACE":
						setSPACE(dictOfProperties,sequenzeID,baseID,effectByTime)
					"EFFECT":
						setEFFECT(dictOfProperties,sequenzeID,baseID,effectByTime)
					"TIME":
						setTIME(dictOfProperties,sequenzeID,baseID,effectByTime)
					"TRIGGER":
						setTRIGGER(dictOfProperties,sequenzeID,baseID,effectByTime)
					
				
		if time != null and time != "N/A":
			var effectCacheComp = EffectTComponent.new()
			
			var spaceComp = SpaceComponent.new()
			spaceComp.initialize(space["medium"],int(space["reach"]),int(space["m-type"]))
			
			var triggerComp = TriggerComponent.new()
			triggerComp.initialize(trigger)
			
			effectCacheComp.initialize(int(time),triggerComp,spaceComp,effect)

			effectComp.setSpecificComp(effectCacheComp,effectByTime)
			effectComp.initDelay()
	print(effectComp)
	
	return effectComp


var skipMode = false

func setTIME(dict,sequenzeID,baseID,effectByTime):
	var cache = dict[sequenzeID][baseID+sequenzeID]
	time = cache


func setTRIGGER(dict,sequenzeID,baseID,effectByTime):
	var cache = dict[sequenzeID][baseID+sequenzeID]
	trigger = cache


func setEFFECT(dict,sequenzeID,baseID,effectByTime):
	var cache = dict[sequenzeID][baseID+sequenzeID]
	effect = cache


func setSPACE(dict,sequenzeID,baseID,effectByTime):
	var cache = dict[sequenzeID][baseID+sequenzeID]
	space = cache




var passMode = false

func isToIgnore(parameter):
	if typeof(parameter) == TYPE_STRING:
		if parameter == "N/A":
			passMode != passMode
			return true
	return false

var predeclaredSyntax




func checkTypeOfEffect(typeString):
	for i in syntax.EFFECT_CATEGORY.size():
		if syntax.EFFECT_CATEGORY.has(typeString):
			return syntax.EFFECT_CATEGORY[i]
	return "no type of effect found"


func getToHubToEffect(type,dictOfProperties):
	match type:
		"CONDITION":
			pass
			#API_01_01_Conditions.giveEntCondition(allConditions[dictOfProperties["values"][0]])
