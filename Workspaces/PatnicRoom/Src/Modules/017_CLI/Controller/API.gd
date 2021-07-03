
# CLASS                                                                           
# CLASS                                                                           
# DOCS                                                                            
# BOOKMARK[epic=Modules] 002_Tilemap_Structure                                    
extends DemocrECTS_Controller


# ----- INITIALICE ----------------------------------------------------------- ##


var cmdsToString  = []
var cmdsSyntax    = {}


func _ready() -> void:   
	for category in API_017_CLI.getSyntax().values():
		for cmd in category.values():
			
			var key         = cmd["input"]
			cmdsSyntax[key] = cmd
			cmdsToString.append(key)




func processCmd(cmd:String,arrOfParameter:Array): 
	cmdsSyntax[cmd]["class"].run(arrOfParameter)


func getSyntax(): return _017_Syntax.getSyntax()
