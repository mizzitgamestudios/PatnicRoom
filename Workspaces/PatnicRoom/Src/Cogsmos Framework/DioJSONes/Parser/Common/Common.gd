
# CLASS                                                                               
# BOOKMARK[epic=Parser] Common                                                        
extends Node
class_name JsonToEntityParser


var unparsableGameElements = []
var exceptionalParses = {}


# ----- MAIN ------------------------------------------------------------------------##


func parseGameData(allDictionaries:Array):
	exceptionalParses[5] = {}
	initialItteration(allDictionaries)
	followedUpDependants()
	exceptions()



func initialItteration(allDictionaries):
	for gameElementDict in allDictionaries:
		var entToFill = Entity.new()
		parseCurrentDict(gameElementDict,entToFill)


func followedUpDependants():
	while !unparsableGameElements.empty():
		for currentEntry in unparsableGameElements:
			parseCurrentDict(currentEntry)


func exceptions():
	for type in exceptionalParses.values():
		for entry in type.values():
		
			match entry["PARSER_EXCEPTION_MARKER"]:
				"NPC_TEMPLATE": addAsNPCTemplate(entry)
			



# ----- PARSING MODES ---------------------------------------------------------------##


func parseCurrentDict(toParse, entToFill:Entity=null):
	match getEnum(toParse):
		ENUM.DIOJSONES.GAME_ELEMENT_STATE.IS_TEMPLATE    : evaluateTemplate(toParse)
		ENUM.DIOJSONES.GAME_ELEMENT_STATE.NEEDS_TEMPLATE : addToQueue(toParse,entToFill)
		ENUM.DIOJSONES.GAME_ELEMENT_STATE.NO_TEMPLATE    : parseDictionary(toParse,entToFill)



# REVIEW   Waits till the next in line is ready, and does not check availabillty      
# REVIEW   of the Templates after it, potential in perfomance-increase                
# FUNC Checks if next Template is allready in the Game and waits/parses accordingly   
func evaluateTemplate(toParse:_DioJSON_Common_Template):
	if toParse.isNeededTemplateAvailable():
		toParse.setTemplateEnt()
		
		if toParse.areTemplatesFullfilled() :   unparsableGameElements.erase(toParse)
		else                                :   parseCurrentDict(toParse, toParse.entOfParse)



# FUNC Adds to waiting order till all needed Templates are Parsed   
func addToQueue(dictToCache:Dictionary, entToFill:Entity):
	var cache = _DioJSON_Common_Template.new(dictToCache,entToFill)
	unparsableGameElements.append(cache)



# FUNC Parses all Components   
func parseDictionary(toConvert:Dictionary, entToFill:Entity):
	#>>> Get current component <<<#
	var compsToString = toConvert.keys()
	var compsValues   = toConvert.values()
	
	for i in toConvert.size(): 
		var cachedCompMeta = _DioJSON_Common_Component.new( compsToString[i], compsValues[i] )
	
	
	#>>> Parse current component <<<#
		var NEEDED_PARSER = ENUM.DIOJSONES.NEEDED_PARSER
		
		match cachedCompMeta.neededParserEnum:

			#>>> Components <<<#
			NEEDED_PARSER.FLAG         :  addAsFlag(cachedCompMeta, entToFill)
			NEEDED_PARSER.SIMPLE       :  addAsComp(cachedCompMeta, entToFill)
			
			#>>> Custome Entities <<<#
			NEEDED_PARSER.EFFECT       :  addAsEffect(cachedCompMeta, entToFill)
			NEEDED_PARSER.LOOT_TABLE   :  addAsLootTable(cachedCompMeta, entToFill)
			
			#>>> Exceptions <<<#
			NEEDED_PARSER.NPC_TEMPLATE :  
				exceptionalParses[NEEDED_PARSER.NPC_TEMPLATE][toConvert.NAME] = toConvert 
				break
	
	
	DemokrECTS.initialiceNewEntry(entToFill)



# ----- SETTER ------------------------------------------------------------------------##


#>>> Components <<<#
func addAsComp(toParse, ent):   ent.addComponent( toParse.run() )

func addAsFlag(toParse, ent):   ent.addFlag( COMP.GET_FLAG(toParse.compToString) )



#>>> Custome Entities <<<#
func addAsEffect(toParse, ent):
	var cache     = toParse.run()
	var effectEnt = API_007_Effect.createEffectByDict(cache.value)
	var component = C_49_EFFECT_REFERENCE.new(effectEnt)
	ent.addComponent(component)

func addAsLootTable(toParse, ent):      pass # STUB   



#>>> Exceptions <<<#
func addAsNPCTemplate(toConvert):
	var cache = API_011_ProcgenActor.createActorTemplate(toConvert)
	API_001_Atlas.ActorTemplate().addEntity(cache)



# ----- HELPER ------------------------------------------------------------------------##


func getNeededParserEnum(): return ENUM.DIOJSONES.NEEDED_PARSER

func getEnum(toParse):
	if toParse is _DioJSON_Common_Template : return ENUM.DIOJSONES.GAME_ELEMENT_STATE.IS_TEMPLATE
	if COMP.HAS_DICT_TEMPLATE(toParse)     : return ENUM.DIOJSONES.GAME_ELEMENT_STATE.NEEDS_TEMPLATE
	else                                   : return ENUM.DIOJSONES.GAME_ELEMENT_STATE.NO_TEMPLATE



