extends Node
# CLASS One Of the most important Classes in our Game.                            
# CLASS They are Compositions of multiple Components and Templates.               
# CLASS There are more specific Entities which uses its Dictionary and functions. 
class_name Entity

# ----- INITIALICE ----------------------------------------------------------- ##

# VAR Key: nameOfTemplate                                                                    
var dictOfTemplates: Dictionary = {}

# VAR Key: list entry number of its name in PatnicRoom/config/knownComponents.json           
var dictOfComps: Dictionary = {}

var arrOfFlags: Array = []

var dictOfConds: Dictionary = {}


func _init() -> void:
	DemokrECTS.atlas_entities[self.get_instance_id()] = self
	


# ----- GETTER --------------------------------------------------------------- ##


# FUNC !NOTE! does not return primitve Datatype, use this: getCompValue()                    
# FUNC return value-type may vary                                                            
func getComp(componentName):	
	if has(str(componentName)):    return self.dictOfComps[str(componentName)]
	else:                          return print("no component of number "+str(componentName)+" found")


# FUNC !NOTE! does not return primitve Datatype, use for this: getCompTempValue()            
func getCompTemp(templateName:String, componentname:String):  
	return dictOfTemplates[templateName].dictOfComps[componentname]



# FUNC return type may vary                                                                  
func getCompValue(componentName):  
	return self.getComp(componentName).value


# FUNC return type may vary                                                                  
func getCompTempValue(templateName:String, componentname:String):
	return getCompTemp(templateName,componentname).value



# ----- SETTER --------------------------------------------------------------- ##


# FUNC !NOTE! Parameter has to be instance of COMP.ATLAS_INDEX_COMP 
func addComponent(component) -> void:
	dictOfComps[component.name] = component
	component.owner = self


func removeComponent(componentName:String) -> void:
	if has( componentName.to_lower() ):  
		dictOfComps.erase(componentName.to_lower())	


func addTemplate(templateName:String, ent:Entity) -> void:
	dictOfTemplates[templateName] = ent

func addFlag(flagNr) -> void:
	arrOfFlags.append(flagNr)



# ----- VALDATOR ------------------------------------------------------------- ##


func hasCond(condName:String)      -> bool:   return self.dictOfConds[condName]
func has(componentName:String)     -> bool:   return self.dictOfComps.has(componentName)
func hasFlag(componentName) -> bool:   
	if componentName is String : return self.arrOfFlags.has(componentName)
	if componentName is int    : return self.arrOfFlags.has(componentName)
	return false

