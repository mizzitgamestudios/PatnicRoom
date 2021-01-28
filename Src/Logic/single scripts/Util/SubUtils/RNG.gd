extends Node
class_name RNGClass


func getRandomNumber(from,to):
	var rng=RandomNumberGenerator.new()
	rng.randomize()
	return rng.randi_range(from,to)



var arrayOfBackgroundsRest =[
	"res://Media/GUI/restmode/background/five.png",
	"res://Media/GUI/restmode/background/four.png",
	"res://Media/GUI/restmode/background/three.png",
	"res://Media/GUI/restmode/background/two.png",
	"res://Media/GUI/restmode/background/one.png",
]

var arrayOfBackgroundPanic = [
	"res://Media/GUI/Panicmode/background/backgroundOnepng.png"
]
func getRngBackground():
	var rn = Util.RNG.getRandomNumber(-1,arrayOfBackgroundsRest.size()) 
	var currentBackground = arrayOfBackgroundsRest[rn-1]
	
	var texture = load(currentBackground)
	return texture
func getRngBackgroundPanic():
	var rn = Util.RNG.getRandomNumber(0,arrayOfBackgroundPanic.size()) 
	var currentBackground = arrayOfBackgroundPanic[rn-1]
	
	var texture = load(currentBackground)
	return texture
