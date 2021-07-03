extends Viewport
class_name MouseHoverOverTileMap


# ----- INITIALICE ----------------------------------------------------------- ##

var mouseLogic
var debugPanel
var lookAt = preload("res://Src/scenes/Templates/GUI/Look at Panel/look at.tscn")

	
func _ready():
	mouseLogic = MouseLogic.new()
	debugPanel = .get_tree().get_root().get_node("Node2D/root_ViewMode/Debug")
	
	mouseLogic.initialice(self.size)



# ----- INPUT HANDLER -------------------------------------------------------- ##

var isMouseOnNode = true
var lookAtInst

func _input(event: InputEvent) -> void:
	var mousePos = get_viewport().get_mouse_position() # pos by pixel
	if  mouseLogic.manageMouseVisibillity(mousePos):

		givePlayerFeedback(mousePos)
		


		if event.is_action("Interface_Mouse_Left"):
			pass
			
		if event.is_action("Interface_Mouse_Right"):
			showOnlookMenue()
	




var lastPos = Vector2(0,0)
func givePlayerFeedback(mousePos):
	var ent = mouseLogic.getContextualEntityOfHover(mousePos)
	showOnDebug(ent)
	drawMouseOnTilemap(ent,mousePos)



# ----- DEBUG ---------------------------------------------------------------- ##

func showOnDebug(ent):
	debugPanel.get_node("position dynamic").bbcode_text = str( ent.pos()          )
	debugPanel.get_node("texture dynamic").bbcode_text  = str( ent.textureID()    )
	debugPanel.get_node("Type dynamic").bbcode_text     = str( ent.typeToString() )


func drawMouseOnTilemap(ent,mousePos):
	var currentPos      = mouseLogic.getMousePos(mousePos)
	var saniticedPos    = Vector2(currentPos.y,currentPos.x-1)
	
	var textureIDToShow = MouseMarker.getMouseMarker(ent)

	SokraTiles.getSelection().drawMouseSelection(lastPos,-1)
	SokraTiles.getSelection().drawMouseSelection(saniticedPos,textureIDToShow)

	
	lastPos = saniticedPos



# ----- ONLOOK --------------------------------------------------------------- ##

func freeLookAt():
	if is_instance_valid(lookAtInst): lookAtInst.queue_free()

func showOnlookMenue():
	var mousePos = get_viewport().get_mouse_position() # pos by pixel
	var ent = mouseLogic.getContextualEntityOfHover(mouseLogic.getMousePos(mousePos))
	freeLookAt()
	lookAtInst = lookAt.instance()
	lookAtInst.initialice(ent,mouseLogic.mousePos,self)
	get_tree().get_root().add_child(lookAtInst)
