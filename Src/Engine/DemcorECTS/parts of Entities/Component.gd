###############################################################################################################################
#                                                                                                                             #
# Klasse:		Component                                                                                                     #
# description:  Basic container for data storager                                                                             #
#                                                                                                                             #
# data flow:	                                                                                                              #
# often called:	N/A                                                                                                           #
#                                                                                                                             #
###############################################################################################################################

extends Object
class_name Component

var name: String

func toString() -> String:
	return name.to_lower()




