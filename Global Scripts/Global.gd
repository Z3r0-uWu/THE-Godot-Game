extends Node

#cords to teleport char
var xcode: float
var ycode: float

#when double jump is allowed
var able_double_jump: int = 2

#Health, Hearts/Bones
var health_player: int = 5
var carcy_health: int = 5

#Weapon dammages
var punch_damage: int

#Upgrades for weapons
var upgrade_punch: int = 0

#Talking to a NPC
var talking = false

#If player is talking to the player at the moment
var able_talking = true

#Never Talking
var Never_talking = false
var times_talked = 0

#Guard Talking
var times_talked_guard = 0

#Goobert Talking
var time_talking_goobert = 0

#Times the player has shower
var has_showered = 0
