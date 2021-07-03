extends Node
class_name Statistics_effectsSyntax_MD



static func calcStats():
	var file     = File.new()
	var mdWriter = MarkdownWriter.new()
	
	
	mdWriter.add_template_title("Effect-Syntax")
	
	mdWriter.add_template_title("Trigger Specific")
	parse(SYNTAX.EFFECT().TRIGGER.SPECIFIC.values(),mdWriter)
	
	mdWriter.add_template_title("Space Source")
	parse(SYNTAX.EFFECT().SPACE.SOURCE.values(),mdWriter)
	mdWriter.add_template_title("Space Medium")
	parseAlt(SYNTAX.EFFECT().SPACE.MEDIUM.values(),mdWriter)
	
	
	mdWriter.writeData("res://tools/Statistics/output/Syntax Components.md")



static func parse(toParse,mdWriter):
	mdWriter.add_linebreak()
	mdWriter.create_table(toParse[0].getDoc().keys())
	for entry in toParse:
		var currentCompStats = entry.getDoc()
		mdWriter.add_row_table(currentCompStats.values())
		
	mdWriter.add_linebreak()
	
	
static func parseAlt(toParse,mdWriter):
	mdWriter.add_linebreak()
	mdWriter.create_table(toParse[0]["API"].getDoc().keys())
	for entry in toParse:
		var currentCompStats = entry["API"].getDoc()
		mdWriter.add_row_table(currentCompStats.values())
		
	mdWriter.add_linebreak()


static func formatTableCollumn(newCollumn:String,otherCollumns:Array):
	var formatedRow = []
	formatedRow.append(newCollumn)
	formatedRow += otherCollumns

	return formatedRow





