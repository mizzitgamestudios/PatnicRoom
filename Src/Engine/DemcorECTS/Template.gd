##########################################################################################################
##                                                                                                      ##
##                                                                                                      ##
##                                                                                                      ##
##                                                                                                      ##
##                                                                                                      ##
##                                                                                                      ##
##                                                                                                      ##
##########################################################################################################
extends Component
class_name TemplateManager

var allTemplateEntries = {}



################################################################################
##  --- Main ---                                                              ##
################################################################################

func addEntryToList(id,componentsdictionary):
	allTemplateEntries[id]=componentsdictionary

func getTemplateInSavetyMode(id,managerName):
	entityInTemplateNotFound_Exception(id,managerName)
	return getRace(id)

func getComponentOfTemplateInSavetyMode(id,component,managerName):
	componentInEntityInTemplaterNotFound_Exception(id,component,managerName)
	return getRace(id)[component]



################################################################################
##  --- Exceptions ---                                                        ##
################################################################################

func componentInEntityInTemplaterNotFound_Exception(id,component,managerName):
	entityInTemplateNotFound_Exception(id,managerName)
	if !isComponentInEntityInList(id,component):
		print("---EXCEPTION---")
		print(component+" in Entity "+id+" of EntityManager"+managerName+" nor found")

func entityInTemplateNotFound_Exception(id,managerName):
	if !isEntityInList(id):
		print("---EXCEPTION---")
		print(id+" in EntityManager "+managerName+" nor found")



################################################################################
##  --- Helpers / Validators ---                                              ##
################################################################################

func isEntityInList(id):
	return allTemplateEntries.has(id)

func isComponentInEntityInList(id,component):
	return allTemplateEntries[id].has(component)

func getRace(id):
	return allTemplateEntries[id]





