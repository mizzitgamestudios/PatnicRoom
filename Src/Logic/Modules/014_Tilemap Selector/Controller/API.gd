extends DemocrECTS_Controller


#----- INITIALICE ------------------------------------------------------------##

var _Simplex
var _Complex
var _Util

func _init() -> void:
	_Simplex = _014_Simplex.new()
	_Complex = _014_Complex.new()
	_Util = _014_Utils.new()


#----- SHAPES ----------------------------------------------------------------##

# ---- Crosshair ---- #
func drawCrosshairOnPos(reach:int,pos:Vector2,texture):
	_Complex.drawCrosshair(reach,pos,texture)

# ---- Area ---- #
func drawAreaOnPos(reach:int,pos:Vector2,texture):
	_Complex.drawArea(reach,pos,texture)

# ---- Marker ---- #
func drawMarkerOnPos(reach:int,tileName:String,tilemap:SokraTiles_Chunk_Basic,pos:Vector2,texture):
	_Complex.drawMarker(reach,tileName,tilemap,pos,texture)

func drawQuadOnPos(reach:int,pos:Vector2,texture):
	_Simplex.drawMarkerForQuad(reach,pos,texture)


func getMovePos(posBase:Vector2,directionEnum):
	return _Util.modPos(posBase,directionEnum,1)

func drawCellByPosandReach(direction,pos,reach,texture):
	_Simplex.drawCellByPosandReach(direction,pos,int(reach),texture)


 
#----- SHAPES ----------------------------------------------------------------##

func manageToHegel(entArray:Array,mode:String,mod=-1,comp=C_2_ANY_TEXTURE_ID.name_quack()):
	match mode:
		"changeStat":
			for i in entArray.size():
				var texture = entArray[i].getComp(comp)
				HeGEL.changeStat(texture,mod)

		"changeTexture":
			for i in entArray.size():
				var texture = entArray[i].getComp("C_2_ANY_TEXTURE_ID")
				HeGEL.changeStat(texture,mod)
				API_009_Tilemap.appendDirtyTiles(SokraTiles.getMeatInteract(),entArray[i])
				
				var ent = SokraTiles.getMeatInteract().getEntByPos_quack(22,47,true)
				print(ent.textureID())
			


func drawMarkerByKitset(kitSet:KitSetEntity):
	var tilemapSelect   = SokraTiles.getSelection()
	var sourcePos       = API_002_Effect.getSourcePos(kitSet)
	var textur          = API_014_TilemapSelector.getHighlightTile(kitSet)
	
	API_002_Effect.calculateSelectedPositions(kitSet,sourcePos)
	return API_011_Player.getSelectedTiles()
	


#----- SHAPES ----------------------------------------------------------------##

func getHighlightTile(kitset):
	match kitset.initialSelect["SPACE"].medium:
		"AREA":        return "Marker_0_4"
		"LINEA":       return "Marker_1_4"
		"LINEA_AREA":  return "Marker_1_4"
		"SELECT":      return -1

func getAlertTile(kitset):
	match kitset.initialSelect["SPACE"].medium:
		"AREA":        return "Marker_0_5"
		"LINEA":       return "Marker_0_4"
		"LINEA_AREA":  return "Marker_1_4"
		"SELECT":      return "Marker_0_5"
