extends Component
class_name Comp_Actor_Position


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

var value
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Replace with function body.

func _init(var para):
	value = para 
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
