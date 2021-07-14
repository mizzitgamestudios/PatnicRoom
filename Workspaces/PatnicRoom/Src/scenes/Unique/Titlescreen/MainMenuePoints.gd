extends Control

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


func _ready() -> void:
	for i in textAttributes.size():

		var currentAttributes = textAttributes[i]
		var currentTextfield  = FromatedRichtextLabel.new()
		var currentInjectable = Injectables_AddToScene.new()

		var instanceToLoad    = baseFilepathOfInstanceToLoad + str( currentAttributes["instanceToLoad"] ) 

		currentInjectable.initialice(instanceToLoad,self)
		currentTextfield.initialice( currentInjectable,currentAttributes["text"] )
		
		currentTextfield.set_position( currentAttributes["pos"] )
		currentTextfield.set_size(Vector2(300,50))
		currentTextfield.add_font_override("normal_font",font)
		
		self.add_child(currentTextfield)

