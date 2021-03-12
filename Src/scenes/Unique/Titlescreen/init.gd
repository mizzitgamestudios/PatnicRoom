
extends Node




var backgroundFilepaths=[
	"res://Media/GUI/Titlescreen/background/backgroundFour.png",
	"res://Media/GUI/Titlescreen/background/backgroundThree.png",
	"res://Media/GUI/Titlescreen/background/backgroundTwopng.png",]


var animate:bool=false
func _ready():
		setRandomBackground()
		setSubtitle()
		get_node("Hauptmenü").initialice()
		get_node("gametitle").initialice()
		get_node("gametitle/dynamic subtitle").initialice()
		
		
		
		



######################
## -- Background -- ##
######################
func setRandomBackground():
	var rn = Util.RNG.getRandomNumber(-1,backgroundFilepaths.size()) 
	var currentBackground = backgroundFilepaths[rn-1]
	
	var texture = load(currentBackground)
	get_node("background").texture=texture
	
	


#########################
## -- Textanimation -- ##
#########################
func _physics_process(delta):
	get_node("gametitle").animateTitleSprite()
	get_node("gametitle/dynamic subtitle").animateTitleSprite()



############################
	## -- Dynamic SubTitle -- ##
############################
func setSubtitle():
	var allSubtitle = Util.JSONParser.fileToDictionary("res://config/DynamicSubtitle.json")
	
	var rn = Util.RNG.getRandomNumber(0,allSubtitle["inserts"].size()) 
	var subtitleToString = allSubtitle["inserts"][rn-1]
	
	get_node("gametitle/dynamic subtitle").append_bbcode(subtitleToString)


func _input(event):
	if event.is_pressed() and event.is_action("escape"):
		get_node("Hauptmenü").removeAllNodes()















