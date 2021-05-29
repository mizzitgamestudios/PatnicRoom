extends AnimatedSprite


var nthFrameToSwitch
var speed
var sumOfFrames=0
var nthFrameToAnimate
func _init():
	nthFrameToAnimate = 2
	nthFrameToSwitch = 100
	speed = 10
	goesUp=true


var pos
var goesUp
var alphaVal = 0
var alphaValChange = 0.05
func _physics_process(delta):
	sumOfFrames += 1

	if isTimeToShowNextFrame():
		var x = self.get_position().x
		var y = self.get_position().y
		y = y - speed
		alphaVal += alphaValChange
		set_self_modulate(Color( 1, 1, 1, alphaVal ))

		set_position( Vector2(x,y) )






func isTimeToShowNextFrame():
	return sumOfFrames % nthFrameToAnimate == 0

func isTimeToSwitchMode():
	return sumOfFrames % nthFrameToSwitch == 0

func changeMode():
	if goesUp:
		goesUp = false
	elif !goesUp:
		goesUp = true
