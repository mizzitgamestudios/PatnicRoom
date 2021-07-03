extends Node
class_name Statistics_Components_JSON






static func calcStats():
	var file:File
	file = File.new()
	var arrOfAutoDocs   = []

	var allCompsClass   = COMP.ATLAS_INDEX_COMP.values()	
	var allCompsString  = COMP.ATLAS_INDEX_COMP.keys()
	
	for comp in allCompsClass:
		var autoDoc: Dictionary = comp.getAutoDoc()
		autoDoc["componentName"] = comp.name_quack()     
		arrOfAutoDocs.append(autoDoc)

	var compDocToJson = JSON.print(arrOfAutoDocs,"\t")

	file.open("res://tools/Statistics/output/components.json",File.WRITE)
	file.store_line(compDocToJson)
	file.close()



 

	
