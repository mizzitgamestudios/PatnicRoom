extends Component
class_name TemplateManager

var allTemplateEntries = {}


#----- GETTER ----------------------------------------------------------------##


func addEntryToList(templateName,componentsdictionary):
	allTemplateEntries[templateName]=componentsdictionary

func getTemplateInSavetyMode(tempalteName):
	return getTemplate(tempalteName)

func getComponentOfTemplateInSavetyMode(templateName:String,component:String):
	return getTemplate(templateName)[component]



#----- HELPERS / VALIDATORS --------------------------------------------------##

func isEntityInList(id):
	return allTemplateEntries.has(id)

func isComponentInEntityInList(id,component):
	return allTemplateEntries[id].has(component)

func getTemplate(id):
	return allTemplateEntries[id]




