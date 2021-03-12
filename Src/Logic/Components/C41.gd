extends Component
class_name C_41_ANY_POSITION


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

var value= Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Replace with function body.

func _init():
	name="C_41_ANY_POSITION"
 

func setPos(posPara):
	value = posPara

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
static func name_quack():
	return "C_41_ANY_POSITION"
