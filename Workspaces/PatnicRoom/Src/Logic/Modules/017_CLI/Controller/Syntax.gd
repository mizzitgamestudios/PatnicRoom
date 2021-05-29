extends Object
class_name _017_Syntax


static func getSyntax():
	return{
		"get kit base":{ 
			 "parameter" : ["name of kit"]
			,"toString"  : "get baseKitPart"
			,"class"     : "" 
			,"list"      : []
		},
		
		"get kit mod":{ 
			 "parameter" : ["name of kit"]
			,"toString"  : "get modKitPart"
			,"class"     : ""
			,"list"      : []
		},
		
		"get kit appendix" : { 
			 "parameter" : ["name of kit"] 
			,"toString"  : "get appendixKitPart"
			,"class"     : ""
			,"list"      : [] 
		},
		
		"equip kit" : { 
			 "parameter" : ["base","mod","appendix"] 
			,"toString"  : "equip kit in slot1 (at least base)"
			,"class"     : ""
			,"list"      : [] 
		},
		
		"set health" : { 
			"parameter": ["number"] 
			,"toString"  : "set own Health"
			,"class"   : ""
			,"list"      : []
		},
		
		"spawn actor" : { 
			 "parameter" : [] 
			,"toString"  : "spawn random actor above"
			,"class"     : ""
			,"list"      : []
		},
		
		"spawn tile" : { 
			 "parameter" : ["textureID"] 
			,"toString"  : "spawn tile above"
			,"class"     : ""
			,"list"      : [] 
		},
		
		"kill all" : {
			 "parameter" : [] 
			,"toString"  : "kill all actors (not you,lul)"
			,"class"     : ""
			,"list"      : [] 
		},
		
		
		
		

	}







