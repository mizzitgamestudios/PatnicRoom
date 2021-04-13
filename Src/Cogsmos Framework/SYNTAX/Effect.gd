extends Node
class_name Syntax_Effect


#----- TRIGGER -------------------------------------------------------------------##

const EFFECT_TRIGGER_BASE = {
	"INTERACT"          : "PROJECTILE_HIT",
	"ACTOR"             : "SELF",
	"TILE"              : "TOUCHING",

	"INTERACT_ACTOR"    : "INTERACT_ACTOR",
	"INTERACT_TILE"     : "INTERACT_TILE",
	"TILE_ACTOR"        : "TILE_ACTOR",

	"ALL"               : "ALL" }

const EFFECT_TRIGGER_SPECIFIC = {
	"BASE"             : "BASE",
	"HAS_CONDITION"    : "HAS_CONDITION",
	"HAS_STAT"         : "HAS_STAT",
	"HAS_TEXTURE"	   : "HAS_TEXTURE",
	"CHANCE"           : "CHANCE" }

	

#----- SPACE ---------------------------------------------------------------------##

const EFFECT_SPACE_SOURCE = {
	"SELF"             : "SELF",
	"LAST_HIT"         : "LAST_HIT",
   "TEXTURE"		   : "TEXTURE",
	"LAST_TARGET"      : "LAST_TARGET" }

	 

const EFFECT_SPACE_MEDIUM = {
	"LINEA"            : "LINEA",
	"SELECT"           : "SELECT",
	"AREA"             : "AREA",
	"SELF"             : "SELF",
	"ACTOR"            : "ACTOR",
	"LINEA_AREA"       : "LINEA_AREA"}



#----- CONDITION -------------------------------------------------------------------##

const EFFECT_UNIQUE_CONDITION = {}
