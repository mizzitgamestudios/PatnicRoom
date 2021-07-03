extends Node
class_name MarkdownWriter

var currentTableCollumns = 0

var currentNumeration = 0
var nummerationDepth = 0
var currentNummerationOfDepth = 0

var _stringOfMd    : String


func _init() -> void:
	_stringOfMd   = ""







# Simple Syntax
func add_content_new_line(content):		_addRawContent(content + str("\r\n") )
func add_content_same_line(content):	_addRawContent(content)

func add_linebreak():					_addRawContent( str("\r\n") )
func add_header(content,size:int=3):	_add_header(content, size)

func add_bold(content):     			_addRawContent( str("**") + content + str("**") )
func add_boldln(content):				_addRawContent( str("**") + content + str("** \r\n") )

func add_italic(content): 				_addRawContent( str("*")  + content + str("*")  )
func add_italicln(content):				_addRawContent( str("*")  + content + str("* \r\n")  )


# Table
func create_table(collumns):			_create_table(collumns)
func add_row_table(collumns):			_add_row_table(collumns)


# Template
func add_template_title(content:String):
	add_header(content,1)
	add_linebreak()
	add_linebreak()
	add_linebreak()


# Render
func writeData(filepath):
	var file = File.new()
	file.open(filepath,file.WRITE)
	file.store_line(_stringOfMd)
	file.close()






func _addRawContent(content):
	var currentContent   = _stringOfMd
	var saniticedContent = content
	
	if content is int or content is float: saniticedContent = str(content)
	
	_stringOfMd = str(currentContent+saniticedContent)


func _add_header(content:String,size:int):
	var cachedStr: String
	while size != 0:
		cachedStr += "#"
		size -= 1
	
	add_linebreak()
	add_linebreak()
	_addRawContent(cachedStr+" "+content+"\r\n")







func _create_table(collumns):
	#add_content_new_line("\r\nPress  to move the Table to the left/right.\r\n")
	currentTableCollumns = collumns.size()
	
	var separator = []
	for i in collumns.size():  separator.append(" -- ")
	
	add_row_table(collumns)
	add_row_table(separator)





func _add_row_table(collumns):
	if currentTableCollumns != collumns.size():
		print("table not applyable: excpected"+str(currentTableCollumns)+" but got "+str(collumns.size()))
		
	else:
		var cachedStr:String = ""
		for i in collumns.size():
			var currentCollumnContent = collumns[i]
			
			cachedStr +=str("|")
			cachedStr +=str(" "+str(currentCollumnContent)+" ")
			
		cachedStr += str("| \r\n")
		_stringOfMd += cachedStr

