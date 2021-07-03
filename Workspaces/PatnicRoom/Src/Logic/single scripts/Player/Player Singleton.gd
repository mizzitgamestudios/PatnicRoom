extends Node


var kitventory
var runner
var team
var cloudPrinter
var recycler
var worldMap
var stats
var common

func _ready() -> void:
	

	cloudPrinter=Cloudprinter.new()
	kitventory = Kitventory.new()
	recycler = Recycler.new()
	stats = Stats.new()
	common = Common.new()
	runner = Runner.new()
	#runner.inventory = Inventory.new()
	team = Team.new()

##############################################################################
##  --- VARIABLEN ---                                                      ##
##############################################################################

# --- META --- #
var playername = "default"

# --- SHARED ---#
var gold = -1
var devmode="true"

func characterCreationProcess():
	API_006_Player.generateNewChar()
	pass
	

