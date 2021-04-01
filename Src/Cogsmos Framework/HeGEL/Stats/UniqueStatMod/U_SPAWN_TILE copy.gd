extends Object
class_name U_MOVE_TILE



static func run(selectedPos, modValue):

	var posOfPlayer = API_011_Player.currentChar.pos()
	var posOfTarget = selectedPos.pos()

	var walkOnY = false

	if posOfPlayer.x == posOfTarget.x: walkOnY = true
	
	var reach

	if walkOnY:  reach = posOfPlayer.y - posOfTarget.y
	else:        reach = posOfPlayer.x - posOfTarget.x



	for i in reach:

		if walkOnY:
			if reach >= 0:    SokraTiles.getPlayer().movePlayer(ENUM.DIRECTION_FOUR.NORTH)
			else:             SokraTiles.getPlayer().movePlayer(ENUM.DIRECTION_FOUR.SOUTH)
		
		else:
			if reach >= 0:    SokraTiles.getPlayer().movePlayer(ENUM.DIRECTION_FOUR.WEST)
			else:             SokraTiles.getPlayer().movePlayer(ENUM.DIRECTION_FOUR.EAST)
	


		if modValue[0] == "CHARGE":
			var johnyCache = SokraTiles.Actors_on_map.values().size()

			for j in johnyCache:
				var currentChar = SokraTiles.Actors_on_map.values()[j]
				var pos = currentChar.pos()

				if pos == posOfPlayer:
					U_DEAL_PLAIN_DAMAGE.run(currentChar,modValue[1])
					




	
 
