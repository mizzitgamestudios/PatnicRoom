extends Object
class_name DemocrECTS_EntityManager

 
#----- INITIALICER ---------------------------------------------------------------##

var name: String =""
var entityType
var mandatoryComponents: Array
var knownEntities: Array

#VAR namePara: name of System                                                 
#VAR mandatoryComponents Array of String value of lowest common denominators  
func _init(namePara:String, mandatoryComponentsPara:Array):
	name          = namePara
	
	for i in mandatoryComponentsPara.size():
		mandatoryComponents.append( mandatoryComponentsPara[i].name_quack() )



#----- GETTTER ---------------------------------------------------------------##

func getKnownEntities():
	return knownEntities


#VAR type class-type to check is on default the Class of instancingParameter 
func getEntitiesWithComp(componentName:String, onlyMandatory=true):
	if _checkForOnlyMandatory(componentName,onlyMandatory):
		var arrayToReturn  = []

		for i in knownEntities.size():
			var currentEnt = knownEntities[i]
			
			if currentEnt.dictOfComps.keys().has(componentName):
				arrayToReturn.append(currentEnt)
		
		return arrayToReturn
	return []


#VAR type class-type to check is on default the Class of instancingParameter 
func getEntitiesWithCompValue(componentName:String, value:String, onlyMandatory=true):
	if _checkForOnlyMandatory(componentName,onlyMandatory):
		var arrayToCache  = getEntitiesWithComp(componentName)
		var arrayToReturn = []
		
		for i in arrayToCache.size():
			if str( arrayToCache[i].getComp(componentName) ) == value:
				
				arrayToReturn.append(arrayToCache[i])

		return arrayToReturn
	return []



#----- CREATION --------------------------------------------------------------##

#FUNC creates Entity by Dictionary                                                            
#VAR newEnt is a Parameter to ensure diffrent types of Entities are possible                  
#VAR their Requirements will still be checked with the [mandatoryComponents] of its child     
func _constructEnt_quack(dict,newEnt):
	if _isValid(dict,"dict"):
		for i in dict.size():

			var currentDictEntry = dict.keys()[i]

			# - Components - #
			var compClass    = COMP.GET_COMPONENT(currentDictEntry)
			if is_instance_valid(compClass): 
				var compInstance = compClass.new( dict[currentDictEntry] )
				newEnt.addComponent(compInstance)

			# - Flags - #
			var flagInstance = COMP.GET_FLAG(currentDictEntry)
			if is_instance_valid(flagInstance): newEnt.addFlag(flagInstance)


		return newEnt
	else: return dict


#FUNC converts Entity to specific Entity                             
#FUNC for example: var ent:TileEntity = _copyEnt_quack(otherEnt,ent) 
func _convertEnt_quack(entToConvert,newEnt):
	return _copyEnt_quack(entToConvert,newEnt)

#FUNC deepcopies first parameter,second is needed for typing.        
#FUNC for example: var ent:TileEntity = _copyEnt_quack(otherEnt,ent) 
func _copyEnt_quack(entToCopy,newEnt):
	# - Components - #
	newEnt.dictOfComps     = entToCopy.dictOfComps.duplicate(true)
	# - Flags - #
	newEnt.arrOfFlags      = entToCopy.arrOfFlags.duplicate(false)
	# - Flags - #
	newEnt.dictOfTemplates = entToCopy.dictOfTemplates.duplicate(false)
	
	return newEnt



#----- VALIDATORS ------------------------------------------------------------##

func _isValid(dict_or_ent, type=entityType):
	return _isRightTyping(dict_or_ent, type) and _isFulfillingRequirements(dict_or_ent)


func _isRightTyping(entToCheck,type=entityType):
	if     entToCheck is Dictionary          and type == "dict"  :         return true
	elif   entToCheck is Entity              and type == "ent"   :         return true
	
	else: print("exception in "+name+": "+entToCheck+" not of type"+type); return false

func _isFulfillingRequirements(dict_or_ent):
	var requirementsFullfilled:bool = true
	var toCheck = _getArrayByParaType(dict_or_ent)

	for i in mandatoryComponents.size():
		var currentComp = mandatoryComponents[i]
		
		if !toCheck.has(currentComp):
			_catch_Requirements_Not_Fullfilled(mandatoryComponents[i])
			requirementsFullfilled = false

	return requirementsFullfilled


func _getArrayByParaType(dict_or_ent):
	if dict_or_ent is Entity     :  return dict_or_ent.dictOfComps.keys()
	if dict_or_ent is Dictionary :  return dict_or_ent.keys()


func _checkForOnlyMandatory(componentNameString:String,isOnlyMandatory:bool) -> bool:
	if    isOnlyMandatory and !mandatoryComponents.has(componentNameString) : return false
	else: return true



#----- EXCEPTION -------------------------------------------------------------##

func _catch_optional_Not_Found_Exception(componentName,onlyMandatoryComponents):
	if !mandatoryComponents.has(componentName) and onlyMandatoryComponents:
		print(componentName+" is not part of the mandatory Components in "+name)
		print("this was a limited search,maybe you want to use the third Parameter on false for an extensive search")

func _catch_mandatory_Not_Found_Exception(componentName,onlyMandatoryComponents):
	if !mandatoryComponents.has(componentName) and !onlyMandatoryComponents:
		print(componentName+" is neither part of the mandatory or optional Components in "+name)


func _catch_Requirements_Not_Fullfilled(missing):
		print("The Component "+missing+"is needed but missing in "+name)





