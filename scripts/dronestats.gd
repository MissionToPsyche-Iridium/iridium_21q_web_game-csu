extends Node

#Almost every game object pulls from here.
#BASE DEFS, AKA what the drone starts as.
@onready var b_grabbercooldown: int = 60
@onready var b_grabberspeed: float = 0.04
@onready var b_grabberrange: int = 128
@onready var b_drillspeed: float = 1
@onready var b_drillstr: int = 0
@onready var b_dronespeed: int = 200
@onready var b_droneluck: float = 0
@onready var b_tubespeed: float = 2
@onready var b_rerollcost: int = 5
@onready var b_rerollinc: int = 2
@onready var b_greasemax: int = 0
@onready var b_greasecount: int = 0
@onready var b_orbitalrotmod: float = 0

@onready var grabbercooldown: int = b_grabbercooldown #Frames inbetween grabs 30 per sec, 60 = 2 sec. (def = 2)
@onready var grabberspeed: float = b_grabberspeed #how fast the grabber moves when grabbing something. (def 0.04)
@onready var grabberrange: int = b_grabberrange #How big the radius for the grbaber is (def 128px)

@onready var drillspeed: float = b_drillspeed #Damage delt to block every 30 sec (Ex if set to 1, 30 damage every 1 sec).
@onready var drillstr: int = b_drillstr #TODO, not used anywhere right now. How effected a drill is by harder blocks. (def 0)
#Example of this, if block has a 0.5 str mod, that means damage done to block per frame = drillspeed - |(blockstr - drillstr)|.

@onready var dronespeed: int = b_dronespeed #How fast the drone moves. (def 200)
@onready var droneluck: float = b_droneluck #How lucky the drone is for events. (def 0)
@onready var tubespeed: float = b_tubespeed #Time (sec) between objects leaving the drone and entering the mothership.

@onready var rerollcost: int = b_rerollcost #Base reroll cost, inc by 2 every reroll.
@onready var rerollinc: int = b_rerollinc #Inc reroll cost.

#Vars for items that need it.
@onready var greasemax: int = b_greasemax #Number of blocks for bonus mining power each stage.
@onready var greasecount: int = b_greasecount #Number of blocks mined this stage for grease count.

@onready var orbitalrotmod: float = b_orbitalrotmod #Bonus rate at which orbitals will spin. EX, pluto spins at 1, so adding .1 to this means the orbital spins 10% faster.

@onready var boughtitems: Array = []
#Edit this if you need to test new active items, for example...
#@onready var boughtitems: Array = [Sweeper.new()]
#Mostly need this to make sure we respect stack limits, opens design space, etc...

func get_list_of_stats() -> Dictionary:
	#Returns a dict list of names and values of all drone stats.
	var dict: Dictionary = {
	"Grabber Cooldown" = (grabbercooldown - b_grabbercooldown) / b_grabbercooldown,
	"Grabber Speed" = (grabberspeed - b_grabberspeed) / b_grabberspeed,
	"Grabber Range" = (grabberrange - b_grabberrange) / b_grabberrange,
	"Drill Speed" = (drillspeed - b_drillspeed) / b_drillspeed,
	"Dill Power" = (drillstr - b_drillstr) / b_drillstr,
	"Drone Speed" = (dronespeed - b_dronespeed) / b_dronespeed,
	"Luck" = (droneluck - b_droneluck) / b_droneluck,
	"Tube Speed" = (tubespeed - b_tubespeed) / b_tubespeed,
	}
	return dict
	
func reset():
	grabbercooldown = b_grabbercooldown
	grabberspeed = b_grabberspeed
	grabberrange = b_grabberrange
	drillspeed = b_drillspeed
	drillstr = b_drillstr
	dronespeed = b_dronespeed
	droneluck = b_droneluck
	tubespeed = b_tubespeed
	rerollcost = b_rerollcost
	rerollinc = b_rerollinc
	greasemax = b_greasemax
	greasecount = b_greasecount
	orbitalrotmod = b_orbitalrotmod
	boughtitems = []
	pass
