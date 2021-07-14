
# CLASS                                                                              
# DOCS                                                                               
# CLASS                                                                              
extends Object
class_name DemocrECTS_EntityManager


var entityType													# VAR [""]                      
var mandatoryComponents : Array									# VAR ENUM.MINIMAL_COMP_XXX_ENT 
var knownEntities       : Array
var name                : String


var applyConditionsShorts = ["C_64"]
var applyConditions       = ["C_64_APPLY_CONDITION_WALKING"]

# REFACTOR                                                                           

# ----- INITIALICER -------------------------------------------------------------- ##


# VAR namePara: name of System                                                 
# VAR mandatoryComponents Array of String value of lowest common denominators  
func _init(namePara:String, mandatoryComponentsPara:Array):
	name = namePara
	
	for currentComp in mandatoryComponentsPara:
		mandatoryComponents.append( currentComp.name_quack() )



# ----- GETTTER -------------------------------------------------------------- ##


func getKnownEntities():
	return knownEntities


# ----- CREATION ------------------------------------------------------------- ##


# FUNC creates Entity by Dictionary                                                            
# VAR newEnt is a Parameter to ensure diffrent types of Entities are possible                  
# VAR their Requirements will still be checked with the [mandatoryComponents] of its child     
func _constructEnt_quack(dict,newEnt):
	if _isValid(dict,"dict"):
		for i in dict.size():

			var currentDictEntry = dict.keys()[i]

			# FUNC COMPONENTS #
			var compClass    = COMP.GET_COMPONENT(currentDictEntry)
			if is_instance_valid(compClass): 
				var compInstance = compClass.new( dict[currentDictEntry] )
				newEnt.addComponent(compInstance)
			else:
				for j in applyConditionsShorts.size():
					if currentDictEntry.begins_with(applyConditionsShorts[j]):
						var component = COMP.GET_COMPONENT(applyConditions[j])
						component = component.new( dict.values()[i])
						newEnt.addComponent(component)
						
			# FUNC FLAGS #
			var flagInstance = COMP.GET_FLAG(currentDictEntry)
			if flagInstance is String: 
				newEnt.addFlag(flagInstance)


		return newEnt
	else: return dict


# FUNC converts Entity to specific Entity                             
# FUNC for example: var ent:TileEntity = _copyEnt_quack(otherEnt,ent) 
func _convertEnt_quack(entToConvert,newEnt):
	return _copyEnt_quack(entToConvert,newEnt)

# FUNC deepcopies first parameter,second is needed for typing.        
# FUNC for example: var ent:TileEntity = _copyEnt_quack(otherEnt,ent) 
func _copyEnt_quack(entToCopy,newEnt):
	
	# FUNC  COMPONENTS #
	var allComps = entToCopy.dictOfComps.values()
	for i in allComps.size():
		var compToString = allComps[i].name_quack()
		
		var currentComp = COMP.GET_COMPONENT(compToString)
		var compinstance = currentComp.new(entToCopy.getCompValue(compToString))
		
		newEnt.addComponent(compinstance)
	
	
	# FUNC FLAGS #
	var allFlags = entToCopy.arrOfFlags
	for i in allFlags.size():
		newEnt.arrOfFlags.append(allFlags[i])
	
	newEnt.dictOfTemplates = entToCopy.dictOfTemplates.duplicate(false)
	
	return newEnt



# ----- VALIDATORS ----------------------------------------------------------- ##

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



# ----- EXCEPTION ------------------------------------------------------------ ##

func _catch_optional_Not_Found_Exception(componentName,onlyMandatoryComponents):
	if !mandatoryComponents.has(componentName) and onlyMandatoryComponents:
		print(componentName+" is not part of the mandatory Components in "+name)
		print("this was a limited search,maybe you want to use the third Parameter on false for an extensive search")

func _catch_mandatory_Not_Found_Exception(componentName,onlyMandatoryComponents):
	if !mandatoryComponents.has(componentName) and !onlyMandatoryComponents:
		print(componentName+" is neither part of the mandatory or optional Components in "+name)


func _catch_Requirements_Not_Fullfilled(missing):
		print("The Component "+missing+"is needed but missing in "+name)





