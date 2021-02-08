###############################################################################################################################
#                                                                                                                             #
# Klasse:		Bootstrap                                                                                                     #
# description:	starts up the 4 Engines to initialice them their needed data to start a game-routine                          #
#                                                                                                                             #
# data flow:	                                                                                                              #
# often called:	N/A                                                                                                           #
#                                                                                                                             #
###############################################################################################################################

extends Node



########################
# --- Init ----------- #
########################
func _init() -> void:
	
	InitDemocrECTS.new()
	InitSokraTiles.new()
	InitDioJSONes.new()
	

