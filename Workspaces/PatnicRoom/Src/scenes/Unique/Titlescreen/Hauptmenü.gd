extends Node2D


var baseFilepathOfInstanceToLoad = "res://Src/scenes/Unique/Titlescreen/SubScene/"
var font                         = load("res://Media/FixedDays Font/Text_Default.tres")
var textAttributes = [
	{ "text":"load last game",   "pos":Vector2(1500, 577),   "instanceToLoad":"credits.tscn"                              },
	{ "text":"start new game",   "pos":Vector2(1500, 649),   "instanceToLoad":"create new game/create new game alt.tscn"  },
	{ "text":"credits"       ,   "pos":Vector2(1500, 769),   "instanceToLoad":"News.tscn"                                 },
	{ "text":"options"       ,   "pos":Vector2(1500, 841),   "instanceToLoad":"News.tscn"                                 },
	{ "text":"introduction"  ,   "pos":Vector2(1500, 913),   "instanceToLoad":"Introduction.tscn"                         },
	{ "text":"news"          ,   "pos":Vector2(1500,1000),   "instanceToLoad":"Patchnotes.tscn"                           }
]

var toInsert = ["credits","create new game/create new game alt","News","News","Introduction","Patchnotes"]
func _ready() -> void:
	for i in toInsert.size():
		var entry = toInsert[i]
		get_node(str(i+1)).initialice(baseFilepathOfInstanceToLoad+entry+".tscn") 

