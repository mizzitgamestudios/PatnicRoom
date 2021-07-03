extends FromatedRichtextLabel



func _ready() -> void:
	var injectable = Injectables_AddToScene.new()
	injectable.initialice("res://Src/scenes/Unique/Titlescreen/SubScene/credits.tscn",self)
	
	self.initialice(injectable,"trest")

