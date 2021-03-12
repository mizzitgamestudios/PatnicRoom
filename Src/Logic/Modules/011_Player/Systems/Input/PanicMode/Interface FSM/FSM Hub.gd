extends Object
class_name _011_FSM_Hub_InterfacePanel


#----- INITIALICE ------------------------------------------------------------##

var sidePanelScript:        _011_StateManagaer_Interface
var mouseHoverOverTilemap:  MouseHoverOverTileMap

var parent:Node = Node.new()

func _init(rootNodePara:Node) -> void:
	sidePanelScript       = _011_StateManagaer_Interface.new(rootNodePara)
	mouseHoverOverTilemap = MouseHoverOverTileMap.new()

	parent = rootNodePara



#----- MANAGER ---------------------------------------------------------------##

var stateCache = 0
func takeActionByEnum(event:InputEvent,previousState:int) :
		
	
	# --- DEFAULT --- #
	if event.is_action("Panic_Info_Kits"):
		stateCache = ENUM.PANIC_INTERFACE_STATE.KITS
		manageMeta(previousState,stateCache)
		sidePanelScript.manageSidepanel("Panic_Info_Kits")
		return ENUM.PANIC_INTERFACE_STATE.KITS
	
	
	if event.is_action("Panic_Info_Jur"):
		stateCache = ENUM.PANIC_INTERFACE_STATE.JURNAL
		manageMeta(previousState,stateCache)
		sidePanelScript.manageSidepanel("Panic_Info_Jur")
		return ENUM.PANIC_INTERFACE_STATE.JURNAL
	
	
	if event.is_action("Panic_Info_Mon"):
		stateCache = ENUM.PANIC_INTERFACE_STATE.MONITOR
		manageMeta(previousState,stateCache)
		sidePanelScript.manageSidepanel("Panic_Info_Mon")
		return ENUM.PANIC_INTERFACE_STATE.MONITOR
	
	
	if event.is_action("Panic_Info_News"):
		stateCache = ENUM.PANIC_INTERFACE_STATE.NEWS
		manageMeta(previousState,stateCache)
		sidePanelScript.manageSidepanel("Panic_Info_News")
		return ENUM.PANIC_INTERFACE_STATE.NEWS
	
	
	
	# --- EXCEPTION --- #
	if event.is_action("escape"):
		#for i in mapNode.get_node("open Info panel").get_child_count():
		#	parent.get_node("open Info panel").remove_child(parent.get_node("open Info panel").get_child(i))
		return ENUM.PANIC_INTERFACE_STATE.ROOT
	
	
	
	
	return stateCache






func manageMeta(previousState,stateCachePara):
	Signals.emit_signal("checkRootOfPanicInterface")
	checkForRoot(previousState)
	checkForSame(previousState,stateCachePara)
	

func checkForSame(previousState:int,pressedEnum:int):
	if previousState == pressedEnum:
		sidePanelScript.isSame = true
	else:
		sidePanelScript.isSame = false

func checkForRoot(previousState:int):
	if previousState == ENUM.PANIC_INTERFACE_STATE.ROOT:
		sidePanelScript.isRoot = true
	else:
		sidePanelScript.isRoot = false






