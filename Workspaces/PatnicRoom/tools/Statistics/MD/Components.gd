extends Node
class_name Statistics_components_MD



static func calcStats():
	var file     = File.new()
	var mdWriter = MarkdownWriter.new()
	
	var allCompsClass          = COMP.ATLAS_INDEX_COMP.values()
	var allCompsString         = COMP.ATLAS_INDEX_COMP.keys()

	mdWriter.add_template_title("Components")
   

	var arrOfTableHeader = formatTableCollumn("name", allCompsClass[0].getAutoDoc().keys() )
	mdWriter.create_table(arrOfTableHeader)

 
	for i in allCompsString.size():
		var currentCompString  = allCompsString[i]
		var currentCompClass   = allCompsClass[i]
		var currentCompStats   = currentCompClass.getAutoDoc()
		
		var rowContent = formatTableCollumn(currentCompString, currentCompStats.values() )

		mdWriter.add_row_table(rowContent)
		
	
		
	
	mdWriter.writeData("res://tools/Statistics/output/Atlas_Components.md")






static func formatTableCollumn(newCollumn:String,otherCollumns:Array):
	var formatedRow = []
	formatedRow.append(newCollumn)
	formatedRow += otherCollumns

	return formatedRow





