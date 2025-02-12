extends Node

#Almost every game object pulls from here.
#Editing these values changes there values.

@onready var grabbercooldown: int = 120 #Frames inbetween grabs, 120 @ 60fps = 2 sec.
@onready var grabberspeed: float = 0.04 #how fast the grabber moves when grabbing something.

@onready var drillspeed: float = 1 #time (sec) it takes for a drill to fully break a block.
@onready var drillstr: int = 0 #TODO, not used anywhere right now.

@onready var dronespeed: int = 200 #How fast the drone moves.

@onready var tubespeed: float = 2 #Time (sec) between objects leaving the drone and entering the mothership.



func recalculate_vars(): #used to recalculate vars for upgrades, actives, etc...
	#TODO
	pass
