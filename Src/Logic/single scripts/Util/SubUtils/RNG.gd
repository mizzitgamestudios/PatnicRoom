###############################################################################################################################
#                                                                                                                             #
# Klasse:		Filehub Util                                                                                                  #
# description:	converts and autofills DIctionary                                                                             #
#                                                                                                                             #
# data flow:	SokraTiles -> PanicMode -> Actor Layor                                                                        #
#                                                                                                                             #
# often called:	@getListOfFilePathsOfDirectory() with parameter String as Filepath                                            #
#                                                                                                                             #
#                                                                                                                             #
#                                                                                                                             #                                              #
#                                                                                                                             #
###############################################################################################################################

extends Node
class_name RNGClass



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

func getRandomNumber(from,to):
	var rng=RandomNumberGenerator.new()
	rng.randomize()
	return rng.randi_range(from,to)

func getRandomPositionModifier(factor:int):
	var positionModifier = Vector2(0,0)
	for i in factor:
		var dir = Util.RNG.getRandomNumber(0,7)
		match dir:
			0: positionModifier += Vector2(1,0)
			1: positionModifier += Vector2(1,1)
			2: positionModifier += Vector2(0,1)
			3: positionModifier += Vector2(-1,1)
			4: positionModifier += Vector2(-1,0)
			5: positionModifier += Vector2(-1,-1)
			6: positionModifier += Vector2(0,-1)
			7: positionModifier += Vector2(1,-1)
	return positionModifier



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
