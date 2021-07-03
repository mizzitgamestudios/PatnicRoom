extends Object
class_name _017_Syntax


static func getSyntax():
	return{


		"common":{
			
			"restmode" : {
				 "parameter" : [] 
				,"toString"  : "enters the P@nicroom of the chunk"
				,"class"     : _API_017_Cmd_Restmode
				,"list"      : [] 
				,"input"     : "restmode"
			},
			
			"noclip" : {
				 "parameter" : [] 
				,"toString"  : "walking through inwalkables"
				,"class"     : ""
				,"list"      : [] 
				,"input"     : "no clip"
			},
			
			"nodeath" : {
				"parameter" : [] 
			   ,"toString"  : "no condition or attacks affects player"
			   ,"class"     : ""
			   ,"list"      : [] 
			   ,"input"     : "no death"
			}
		},



		"kits":{
			
			"get kit base":{ 
				"parameter" : ["name of kit"]
			   ,"toString"  : "add BasePart to kitventory"
			   ,"class"     : "" 
			   ,"list"      : []
			   ,"input"     : "kit base"
			},
			
			"get kit mod":{ 
				 "parameter" : ["name of kit"]
				,"toString"  : "add ModPart to kitventory"
				,"class"     : ""
				,"list"      : []
				,"input"     : "kit mod"
		   },
			
		   "get kit appendix" : { 
				"parameter" : ["name of kit"] 
			   ,"toString"  : "add AppendixPart to kitventory"
			   ,"class"     : ""
			   ,"list"      : [] 
			   ,"input"     : "kit appendix"
			}
		},



		"gear":{
			
			"add credits":{ 
				"parameter" : ["amount"]
			   ,"toString"  : "add credits to account"
			   ,"class"     : "" 
			   ,"list"      : []
			   ,"input"     : "credits"
		   },
			"add item":{ 
				"parameter" : ["name of item"]
			   ,"toString"  : "add items to Inventory"
			   ,"class"     : "" 
			   ,"list"      : []
			   ,"input"     : "item"
		   }
		},



		"spawn":{
			
			"spawn actor" : { 
				"parameter" : [] 
			   ,"toString"  : "spawn random actor above"
			   ,"class"     : ""
			   ,"list"      : []
			   ,"input"     : "actor"
		   },
			
		   "spawn tile" : { 
				"parameter" : ["textureID"] 
			   ,"toString"  : "spawn tile above"
			   ,"class"     : ""
			   ,"list"      : [] 
			   ,"input"     : "tile"
		   }
		},



	}







