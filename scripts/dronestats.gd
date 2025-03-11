extends Node

#Almost every game object pulls from here.
#Editing these values changes there values.
@onready var grabbercooldown: int = 60 #Frames inbetween grabs 30 per sec, 60 = 2 sec. (def = 2) TODO
@onready var grabberspeed: float = 0.04 #how fast the grabber moves when grabbing something. (def 0.04)
@onready var grabberrange: int = 128 #How big the radius for the grbaber is (def 128px)

@onready var drillspeed: float = 1 #Damage delt to block every 30 sec (Ex if set to 1, 30 damage every 1 sec).
@onready var drillstr: int = 0 #TODO, not used anywhere right now. How effected a drill is by harder blocks. (def 0)

@onready var dronespeed: int = 200 #How fast the drone moves. (def 200)
@onready var droneluck: float = 0 #How lucky the drone is for events. (def 0)
@onready var tubespeed: float = 2 #Time (sec) between objects leaving the drone and entering the mothership.

@onready var rerollcost: int = 5 #Base reroll cost, inc by 2 every reroll.
@onready var rerollinc: int = 2 #Inc reroll cost.

@onready var boughtitems: Array = [Pluto.new()]
#Edit this if you need to test new active items, for example...
#@onready var boughtitems: Array = [Sweeper.new()]
#Mostly need this to make sure we respect stack limits, opens design space, etc...


func get_list_of_stats() -> Dictionary:
	#Returns a dict list of names and values of all drone stats.
	var dict: Dictionary = {
		"Grabber Cooldown" = grabbercooldown,
		"Grabber Speed" = grabberspeed,
		"Grabber Range" = grabberrange,
		"Drill Speed" = drillspeed,
		"Dill Power" = drillstr,
		"Drone Speed" = dronespeed,
		"Luck" = droneluck,
		"Tube Speed" = tubespeed,
	}
	return dict
	
func reset():
	grabbercooldown = 60
	grabberspeed = 0.04
	grabberrange = 128
	drillspeed = 1
	drillstr = 0
	dronespeed = 200
	droneluck = 0
	tubespeed = 2
	rerollcost = 5
	rerollinc = 2
	boughtitems = []
	pass
