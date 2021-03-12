extends Viewport
class_name MouseHoverOverTileMap


#----- INITIALICE ------------------------------------------------------------##

var tilemapCenter = ENUM.PANIC_CENTER_TO_DRAW
var layersToCheck = []
var playerTilemapNode 
var debugPanel

var originTilemapByPixel = Vector2(0,0)
var eosTilemapByPixel = self.size

var lookAt = preload("res://Src/scenes/Templates/GUI/Look at Panel/look at.tscn")

func _ready() -> void:
	layersToCheck       = getTilemapOfPerceptionMode()
	playerTilemapNode   = SokraTiles.getPlayer()
	debugPanel          = .get_tree().get_root().get_node("Node2D/root_ViewMode/Debug")

func getTilemapOfPerceptionMode():
	var tilemapFloor = SokraTiles.getMeatFloor()
	var tilemapInter = SokraTiles.getMeatInteract()
	var tilemapActor = SokraTiles.getActor()

	return [tilemapFloor,tilemapInter,tilemapActor]



#----- INPUT HANDLER ---------------------------------------------------------##

var ent
var pos = Vector2(0,0)
var lookAtInst
var isMouseOnNode=true
func _input(event: InputEvent) -> void:
	var mousePos         = get_viewport().get_mouse_position() # pos by pixel
	
	if isMouseOnNode(mousePos):
		
		if isMouseOnNode: Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN);isMouseOnNode=false
		
		var playerPos    = API_011_Player.currentChar.position()
		
		var currrentTile = getMouseHoverOnTilemap(mousePos,playerPos)
		ent = checkForEntites(currrentTile)
		showOnDebug( ent.mouseHover_quack(), currrentTile, ent.typeToString())
		setTilemapPointer(ent.typeToString(),currrentTile)


		if event.is_action("leftClickMouse"):
			API_003_Condition.attachConditionToEnt(ent,"Elemental_Fire_Burning",3)

			API_014_TilemapSelector.manageToHegel([ent],"changeStat",-1)
			
		if event.is_action("rightClickMouse"):
			if is_instance_valid(lookAtInst):lookAtInst.queue_free()
			lookAtInst = lookAt.instance()
			lookAtInst.initialice(ent,mousePos,self)
			get_tree().get_root().add_child(lookAtInst)
	
	#
	#else:
	#	resetTilemapPointer()


func freeLookAt():
	lookAtInst.free()


func isMouseOnNode(mouse):
	return mouse.x > originTilemapByPixel.x and mouse.y > originTilemapByPixel.y and mouse.x < eosTilemapByPixel.x and mouse.y < eosTilemapByPixel.y

var posCache = Vector2(0,0)
func setTilemapPointer(entityType,pos):
	var textureIDToShow=""
	
	
	match entityType:
		"TILE"    : textureIDToShow = "Marker_0_7"
		"INTERACT": textureIDToShow = "Marker_0_6"
		"ACTOR"   : textureIDToShow = "Marker_0_8"
	
	
	#pos = Vector2(pos.y-1,pos.x)
	pos = Vector2(pos.y,pos.x-1)
	SokraTiles.getSelection().drawMouseSelection(posCache,-1)
	posCache = pos

	SokraTiles.getSelection().drawMouseSelection(pos,textureIDToShow)

func resetTilemapPointer():
	isMouseOnNode=true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	SokraTiles.getSelection().drawMouseSelection(pos,-1)
	SokraTiles.getSelection().entsOnMap.erase(pos)



#----- GETTER ----------------------------------------------------------------##

func getMouseHoverOnTilemap(mousePos,playerPos):
	var mousePosOfSeen   = getMouseOnTilemap(mousePos)  # pos by tile
	
	var relativeToPlayer = Vector2( tilemapCenter.x-mousePosOfSeen.x,  tilemapCenter.y-mousePosOfSeen.y    )
	var relativeToMap    = Vector2( playerPos.x-relativeToPlayer.x,    playerPos.y-relativeToPlayer.y )
	var saniticedPos     = Vector2( relativeToMap.x,                 relativeToMap.y                ) 

	return saniticedPos # +1Y because map starts at 1 instead of 0 like Arrays


func getMouseOnTilemap(mouse):
	var size = ENUM.PANIC_TILE_PIXEL_SIZE / 2
	return playerTilemapNode.world_to_map( Vector2(mouse.x+size, mouse.y-size) )   # pos by tile SHOWN on screen with deadzone

var typeOfTile = ["TILE","INTERACT","ACTOR"]
func checkForEntites(pos):
	var entityToShow
	
	for i in layersToCheck.size():
		var currentEntity = layersToCheck[i].getEntByPos_quack(pos)
		
		if is_instance_valid(currentEntity): 
			entityToShow = currentEntity
	
	return entityToShow



#----- OUTPUT ----------------------------------------------------------------##

func showOnDebug(texture,pos,type):
	debugPanel.get_node("position dynamic").bbcode_text = str(pos)
	debugPanel.get_node("texture dynamic").bbcode_text = str(texture)
	debugPanel.get_node("Type dynamic").bbcode_text = type



