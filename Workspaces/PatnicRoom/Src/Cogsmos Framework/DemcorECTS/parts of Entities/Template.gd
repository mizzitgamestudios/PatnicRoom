extends Entity
class_name Template


var listOfComponents     : Dictionary
var indexName            : String

var atlasObjectReference : API_001_Atlas
var atlasGetterToString  : String
var subAtlasToString     : String



# ----- GETTER --------------------------------------------------------------- ##
				  

func getIndexName():      return self.indexName
func getAtlasClass():     return atlasObjectReference.call_func(subAtlasToString)
func getAtlasEntries():   return atlasObjectReference.call_func(atlasGetterToString)



# ----- SETTER --------------------------------------------------------------- ##


func addComponent(component) -> void:
	dictOfComps[component.name] = component
	component.owner             = self


func addTemplate(templateName:String, ent:Entity) -> void:
	dictOfTemplates[templateName] = ent


func addFlag(flagNr) -> void:
	arrOfFlags.append(flagNr)



# ----- DEPRECATED --------------------------------------------------------------- ##


# REVIEW   To be deleted by implementing Parent of Entitiy and Template 
func getCompTemp(templateName:String, componentname:String):        pass   
func getCompTempValue(templateName:String, componentname:String):   pass  
func removeComponent(componentName:String) -> void:                 pass  
