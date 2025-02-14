extends Node

#Almost every game object pulls from here.
#Editing these values changes there values.

@onready var grabbercooldown: int = 60 #Frames inbetween grabs 30 per sec, 60 = 2 sec. (def = 2) TODO
@onready var grabberspeed: float = 0.04 #how fast the grabber moves when grabbing something. (def 0.04)
@onready var grabberrange: int = 128 #How big the radius for the grbaber is (def 128px)

@onready var drillspeed: float = 1 #time (sec) it takes for a drill to fully break a block.
@onready var drillstr: int = 0 #TODO, not used anywhere right now. How effected a drill is by harder blocks.

@onready var dronespeed: int = 200 #How fast the drone moves.
@onready var droneluck: float = 0.0 #How lucky the drone is for events.
@onready var tubespeed: float = 2 #Time (sec) between objects leaving the drone and entering the mothership.



func recalculate_vars(): #used to recalculate vars for upgrades, actives, etc...
	#TODO
	pass
