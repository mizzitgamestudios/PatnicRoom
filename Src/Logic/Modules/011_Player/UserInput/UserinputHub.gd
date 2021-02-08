extends Node

var nodeOfPlayerLayer
var nodeOfCamOfPlayer 
var childMenueLoader

func _ready() -> void:
	Signals.connect("animationFinished",self,"backToMenue")
	childMenueLoader = _menueLoader.new(self)

var kitset
var isActionTaken:bool = false
var kitSelected = false
func _input(event: InputEvent) -> void:
	if API_011_Player.getInputMode():
################################################################################
##  --- Map side ---                                                          ##
################################################################################

# --- Directional Input of Player ---
		if not event.is_echo() and event.is_pressed():
			
			if event.is_action_pressed("Panic_Kit_Selection"):
				var numberOfKit = event.as_text()
				kitset = API_011_Player.currentChar.kitsSets.getKitByLevel(int(numberOfKit)-1)
				print("debug")
				kitSelected=true
			if event.is_action_pressed("PlayerDirectionInput")and kitSelected==true:
				var direction = event.as_text()
				print(direction)
				API_005_KitSet.runKitSet(kitset,direction)
				print(direction)
			
			if event.is_action_pressed("PlayerDirectionInput") and !kitSelected:
				
				nodeOfPlayerLayer.interpreteDirection(event)
				nodeOfPlayerLayer.movePlayer()
				nodeOfCamOfPlayer.updateCenter(nodeOfPlayerLayer.playerPos)
				_010_Out.emit_playerTurnFinished()
				
				
				
				
				isActionTaken = true
				

################################################################################
##  --- Info side ---                                                         ##
################################################################################

# --- Type of Infopanel ---
		if not event.is_echo() and event.is_pressed() and !kitSelected:
		
			if event.is_action_pressed("Panic_Info_Kits"):
				checkIsNodeLoaded("root_Kits","kits")
				
			elif event.is_action_pressed("Panic_Info_Jur"):
				checkIsNodeLoaded("root_inv","inv")
		
			elif event.is_action_pressed("Panic_Info_Mon"):
				checkIsNodeLoaded("root_Status","char")
			
			elif event.is_action_pressed("Panic_Info_News"):
				checkIsNodeLoaded("root_News","news")
			
			elif event.is_action_pressed("escape"):
				backToMenue()

	
		
			checkIsPlayerDone()
		
	

func checkIsNodeLoaded(nodeToLook:String,nodeToReplace:String):
	if get_node("open Info panel").has_node(nodeToLook):
		exitAnimation()
	else:
		childMenueLoader.replaceNode(nodeToReplace)




func backToMenue():
	for i in get_node("open Info panel").get_child_count():
		get_node("open Info panel").remove_child(get_node("open Info panel").get_child(i))



func exitAnimation():
	get_node("open Info panel").get_child(0).exitAnimation()


func checkIsPlayerDone():
	if isActionTaken:
		Gameloop.manageRound(ENUM.ACTION_PHASE.PLAYER_DONE)


func recievePlayer(node):
	nodeOfPlayerLayer=node
func recievePlayerCam(node):
	nodeOfCamOfPlayer=node





