extends SokraTiles_Chunk_Basic
class_name SokraTiles_Chunk_Animation


func initialice(layerEnum):
	SokraTiles.addChunkToKnownLayers(layerEnum,self)

	
	

################################################################################
##  --- SELECT ---                                                            ##
################################################################################

var cachedSelects = {}
var allAnimations = {}

func cacheForSelection(toCache:Dictionary): cachedSelects = toCache
func logStaticAnimation(tilesToAnimate):    allAnimations.append(tilesToAnimate)



func cancelCachedSelection():
	for i in cachedSelects.size():
		var currentSelect = cachedSelects[i]
		._drawCell(currentSelect["pos"].x,currentSelect["pos"].y,currentSelect["tex"])

	cachedSelects= {}










