extends Control



func fillForm(kitPart):
	for i in kitPart.size():
		var currentEntry   = kitPart[i]
		var currentRow     = get_node(str(i))
		
		for key in currentEntry.keys():
			var currentCollumn = currentRow.get_node(key)
			var textfield = currentCollumn.get_node("value/RichTextLabel")
			
			if key != "value" : textfield.bbcode_text = currentEntry[key]
			
			else:
				var cache = "" 
				var debug = currentEntry[key]
				for value in debug:  
					cache += str(str(value)+",")
				textfield.bbcode_text = cache
