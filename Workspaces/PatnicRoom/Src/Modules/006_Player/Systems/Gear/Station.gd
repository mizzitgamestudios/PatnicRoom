extends Node
class_name Stations


# ----- INITIALICE ----------------------------------------------------------- ##


var meat           : Station
var matrix         : Station
var magic          : Station

var currentStation : Station


class Station:  
	var kitset: KitSetEntity  ; var kitpartToMod   ; var mode: int
	var currentLength: int    ; var maxLength: int ; var isReady: bool ; var isCounting: bool


func _init() -> void:
	meat   = Station.new()
	matrix = Station.new()
	magic  = Station.new()

	

# ----- MAIN ----------------------------------------------------------------- ##


func changeStation(enumOfStation):        
	currentStation = getStationByEnum(enumOfStation)
	if currentStation.isReady == true: currentStation.run()



func run():
	match currentStation.mode:
		ENUM.KITS.STATION_MODE.ADD    : add()
		ENUM.KITS.STATION_MODE.CHANGE : add()
		ENUM.KITS.STATION_MODE.REMOVE : remove()
	
	var kitset   = currentStation.kitset
	var kitParts = [ kitset.base, kitset.mod, kitset.appendix ]
	kitset       = API_004_KitSet.addKitsetToPlayer(kitParts)
	API_006_Player.appendGearedKitSet(kitset)



# ----- SETTER --------------------------------------------------------------- ##


func remove(): 
	match currentStation.kitpartToMod:
		ENUM.KITS.PARTY_TYPE.MOD      : currentStation.kitset.mod      = null
		ENUM.KITS.PARTY_TYPE.APPENDIX : currentStation.kitset.appendix = null

func add(): 
	match currentStation.kitpartToMod.partType():
		ENUM.KITS.PARTY_TYPE.MOD      : currentStation.kitset.mod      = currentStation.kitpartToMod 
		ENUM.KITS.PARTY_TYPE.APPENDIX : currentStation.kitset.appendix = currentStation.kitpartToMod


func decrementCountdown(): 
	for station in [meat,matrix,magic]: 
		if is_instance_valid(station.kitset):
			station.currentLength += 1
			if station.currentLength == station.maxLength: station.isReady = true



# ----- GETTER --------------------------------------------------------------- ##


func getCurrentStation(): return currentStation



func getStationByEnum(enumOfStation):
	match enumOfStation:
		ENUM.SOKRATILES.M_TYPE.MEAT   : return meat
		ENUM.SOKRATILES.M_TYPE.MATRIX : return matrix
		ENUM.SOKRATILES.M_TYPE.MAGIC  : return magic



		
