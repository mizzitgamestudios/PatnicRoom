extends Object
class_name _010_selectManager




func manageSelectByKeyword(keyword, subFuncPara:Dictionary):
	#keyword.run(subFuncPara["reach"],subFuncPara["pos"],subFuncPara["texture"])
	var SPACE_MEDIUM = SYNTAX.EFFECT.ENTRIES.SPACE.MEDIUM.keys()
	
	var cache = SYNTAX.EFFECT.ENTRIES.SPACE.MEDIUM
	
	
	for entry in SPACE_MEDIUM: if keyword == entry: cache[keyword]["GETTER"].run(subFuncPara) 
#
#
#	match keyword:
#		#SPACE_MEDIUM.LINEA_AREA :   _010_lineaArea.run(subFuncPara)      
#		SPACE_MEDIUM.AREA       :   _010_area.run(subFuncPara)           
#		SPACE_MEDIUM.SELECT     :   _010_select.run(subFuncPara)         
#		SPACE_MEDIUM.LINEA      :   _010_linea.run(subFuncPara)       
#		SPACE_MEDIUM.UNIVERSAL  :   _010_universal.run(subFuncPara)     
#		# TODO: ADD QUAD  
