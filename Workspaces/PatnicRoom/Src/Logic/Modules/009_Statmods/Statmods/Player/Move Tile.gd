extends Object
class_name U_MOVE_USER



static func run(ent, modValue):
	var posOfPlayer = API_006_Player.currentChar.pos()
	var posOfTarget = ent.pos()

	var walkOnY     = false

	if posOfPlayer.x == posOfTarget.x: walkOnY = true
	
	var reach

	if walkOnY:  reach = posOfPlayer.y - posOfTarget.y
	else:        reach = posOfPlayer.x - posOfTarget.x


	for i in reach:
		moveToDirection(walkOnY,reach)

		if modValue[0] == "CHARGE":
			checkForActorsToCharge(posOfPlayer,modValue[1])
					


static func moveToDirection(walkOnY,reach):
	if walkOnY:
		if reach >= 0:    SokraTiles.getPlayer().movePlayer(ENUM.DIRECTION_FOUR.NORTH)
		else:             SokraTiles.getPlayer().movePlayer(ENUM.DIRECTION_FOUR.SOUTH)
	
	else:
		if reach >= 0:    SokraTiles.getPlayer().movePlayer(ENUM.DIRECTION_FOUR.WEST)
		else:             SokraTiles.getPlayer().movePlayer(ENUM.DIRECTION_FOUR.EAST)
	

 
static func checkForActorsToCharge(posOfPlayer,damage):
	var johnyCache = SokraTiles.Actors_on_map.values().size()

	for j in johnyCache:
		var currentChar = SokraTiles.Actors_on_map.values()[j]
		var pos = currentChar.pos()

		if pos == posOfPlayer:
			U_DEAL_PLAIN_DAMAGE.run(currentChar,damage)
