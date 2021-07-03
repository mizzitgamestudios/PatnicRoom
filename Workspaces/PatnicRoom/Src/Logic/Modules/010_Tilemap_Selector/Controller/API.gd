extends DemocrECTS_Controller
# BOOKMARK[epic=Modules] 010_Tilemap_Selector                                    

# ----- INITIALICE ----------------------------------------------------------- ##


var selectManager := _010_selectManager.new()
var _Util

func _init() -> void:
	_Util = _014_Utils.new()


# ----- SHAPES --------------------------------------------------------------- ##

# ---- Crosshair ---- #
func drawCrosshairOnPos(reach:int,pos:Vector2,texture):
	var subFuncPara = { "reach":reach, "pos":pos, "texture":texture }
	selectManager.manageSelectByKeyword(Syntax_Effect.EFFECT_SPACE_MEDIUM.LINEA,subFuncPara)


# ---- Area ---- #
func drawAreaOnPos(reach:int,pos:Vector2,texture):
	var subFuncPara = { "reach":reach, "pos":pos, "texture":texture }
	selectManager.manageSelectByKeyword(Syntax_Effect.EFFECT_SPACE_MEDIUM.AREA,subFuncPara)

# ---- Marker ---- #
func drawMarkerOnPos(reach:int,tileName:String,tilemap:SokraTiles_Chunk_Basic,pos:Vector2,texture):
	var subFuncPara = { "reach":reach, "pos":pos, "texture":texture, "tilemap":tilemap, "tilename":tileName }
	selectManager.manageSelectByKeyword(Syntax_Effect.EFFECT_SPACE_MEDIUM.SELECT,subFuncPara)

func drawQuadOnPos(reach:int,pos:Vector2,texture):
	var subFuncPara = { "reach":reach, "pos":pos, "texture":texture }
	selectManager.manageSelectByKeyword(Syntax_Effect.EFFECT_SPACE_MEDIUM.AREA,subFuncPara)


func getMovePos(posBase:Vector2,directionEnum):
	return _Util.modPos(posBase,directionEnum,1)

func drawCellByPosandReach(direction,pos,reach,texture):
	var subFuncPara = { "reach":int(reach), "pos":pos, "texture":texture, "direction":direction }
	selectManager.manageSelectByKeyword("UNIVERSAL",subFuncPara)


 
# ----- SHAPES --------------------------------------------------------------- ##

func drawMarkerByKitset(kitSet:KitSetEntity):
	var tilemapSelect   = SokraTiles.getSelection()
	var sourcePos       = API_007_Effect.getSourcePos(kitSet)
	var textur          = API_010_TilemapSelector.getHighlightTile(kitSet)
	
	API_007_Effect.calculateSelectedPositions(kitSet,sourcePos)
	return API_006_Player.getSelectedTiles()
	


# ----- SHAPES --------------------------------------------------------------- ##

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
