extends Control

var stationsTicker = []

onready var meatBar   = get_node("Stations/Workshop/Panel/ProgressBar")
onready var matrixBar = get_node("Stations/Terminal/Panel/ProgressBar") 
onready var magicBar  = get_node("Stations/Retreat/Panel/ProgressBar")

onready var meatRtl   = get_node("Stations/Workshop/counter")
onready var matrixRtl = get_node("Stations/Terminal/counter") 
onready var magicRtl  = get_node("Stations/Retreat/counter")

onready var stationsMeta = {
	"MEAT"   : {  "bar":meatBar   , "rtl":meatRtl   },
	"MAGIC"  : {  "bar":magicBar  , "rtl":magicRtl  },
	"MATRIX" : {  "bar":matrixBar , "rtl":matrixRtl  }
}



func _ready() -> void:
	stationsMeta["MEAT"]["bar"].initialice(API_006_Player.getStations().meat,meatRtl)
	stationsMeta["MAGIC"]["bar"].initialice(API_006_Player.getStations().magic,magicRtl)
	stationsMeta["MATRIX"]["bar"].initialice(API_006_Player.getStations().matrix,matrixRtl)
	
	
	for station in stationsMeta.values():
		var stationData = station["bar"].stationMetaData
		
		station["rtl"].bbcode_text = stationProgressToString(stationData,0)
		
		if stationData.isCounting:   
			station["bar"].max_value = stationData.maxLength
			stationsTicker.append(station["bar"])
	
	
	get_node("Timer").start()
	


func _on_Timer_timeout() -> void:
	if !stationsTicker.empty():
		for station in stationsTicker:
			var stationData = station.stationMetaData
			
			if stationData.currentLength == station.value: 
				stationsTicker.erase(station)
			
			if stationData.currentLength != station.value:         
				station.value += 1
			
			station.correspondingRtl.bbcode_text =  stationProgressToString(stationData,station.value)




func stationProgressToString(station,currentBar):
	if !station.isCounting:              return "No Task set!"
	if currentBar == station.maxLength:  return "[color=lime]FINISHED" 
	else:                                return str(currentBar)+" / "+str(station.maxLength)




