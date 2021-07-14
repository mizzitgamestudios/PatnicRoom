extends TextureRect

func _ready():
	get_node(".").texture = Util.RNG.getRngBackgroundPanic()
