extends Object
class_name _010_selectManager




func manageSelectByKeyword(keyword:String, subFuncPara:Dictionary):
	var SPACE_MEDIUM = Syntax_Effect.EFFECT_SPACE_MEDIUM

	match keyword:
		SPACE_MEDIUM.LINEA_AREA :   _010_lineaArea.run(subFuncPara)      
		SPACE_MEDIUM.AREA       :   _010_area.run(subFuncPara)           
		SPACE_MEDIUM.SELECT     :   _010_select.run(subFuncPara)         
		SPACE_MEDIUM.LINEA      :   _010_linea.run(subFuncPara)       
		"UNIVERSAL"             :   _010_universal.run(subFuncPara)     
		# TODO: ADD QUAD  
