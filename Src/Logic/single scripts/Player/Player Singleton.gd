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
	runner.inventory = Inventory.new()
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
	runner.initialice()
	
	

var kit="0"
var race="0"
var perk="0"
var nameText="0"
var seedText="0"
var kitText="0"
func cacheChargen(kitPara,racePara,perkPara,nameTextPara,seedTextPara,kitTextPara):
	kit=kitPara
	race=racePara
	perk=perkPara
	nameText=nameTextPara
	seedText=seedTextPara
	kitText=kitTextPara
