extends Viewport
class_name MouseLogic


#----- INITIALICE ------------------------------------------------------------##

var tilemapCenter = ENUM.PANIC_CENTER_TO_DRAW
var layersToCheck = []
var playerTilemapNode 

func initialice(sizePara):
	eosTilemapByPixel = sizePara
	layersToCheck       = getTilemapOfPerceptionMode()
	playerTilemapNode   = SokraTiles.getPlayer()


func getTilemapOfPerceptionMode():
	var tilemapFloor = SokraTiles.getMeatFloor()
	var tilemapInter = SokraTiles.getMeatInteract()
	var tilemapActor = SokraTiles.getActor()

	return [tilemapFloor,tilemapInter,tilemapActor]



#----- INPUT HANDLER ---------------------------------------------------------##

var pos = Vector2(0,0)


var mousePos
var isMouseOnNode = true
func manageMouseVisibillity(mouse):
	mousePos = mouse

	if  isMouseOnNode(mouse):
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		isMouseOnNode = false
		return true


	if !isMouseOnNode(mouse):
		isMouseOnNode=true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		SokraTiles.getSelection().drawMouseSelection(pos,-1)
		SokraTiles.getSelection().entsOnMap.erase(pos)

		return false

func getMousePos(mousePos):
	var playerPos  = API_011_Player.currentChar.position()
	return getMouseHoverOnTilemap(mousePos,playerPos)

func getContextualEntityOfHover(mousePos):
	return checkForEntites( getMousePos(mousePos) )




var originTilemapByPixel = Vector2(0,0)
var eosTilemapByPixel    
func isMouseOnNode(mouse):
	return mouse.x > originTilemapByPixel.x and mouse.y > originTilemapByPixel.y and mouse.x < eosTilemapByPixel.x and mouse.y < eosTilemapByPixel.y



#----- GETTER ----------------------------------------------------------------##

func getMouseHoverOnTilemap(mousePos,playerPos):
	var mousePosOfSeen   = getMouseOnTilemap(mousePos)  # pos by tile
	
	var relativeToPlayer = Vector2( tilemapCenter.x-mousePosOfSeen.x,  tilemapCenter.y-mousePosOfSeen.y    )
	var relativeToMap    = Vector2( playerPos.x-relativeToPlayer.x,    playerPos.y-relativeToPlayer.y      )
	var saniticedPos     = Vector2( relativeToMap.x,                   relativeToMap.y                     ) 

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



