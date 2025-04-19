extends Node

@onready var timer = Timer.new() #Games timer.

@onready var timetillloss: int = 0 #How much time in sec the player has till they lose.
@onready var day = 1 #Day we are on, from 1-20.

@onready var gameoverscreen = preload("res://Objects/gameover.tscn")
@onready var winscreen = preload("res://Objects/win.tscn")

#HUGE dict of scaling.
#Sizex = size of mine x
#sizey = size of mine y
#time = time in sec player has
#oredict = dict to be passed to the mine.
#required = required value (in scrap) the player needs to obtain.
@onready var diffdict = {
	1: {
		"sizex": 15,
		"sizey": 15,
		"time": 120,
		"required": 5,
		"oredict": {
				0: 5,
				2: 4,
				3: 2,
				5: 0,
				6: 0,
				7: 0
				}
	},
	2: { #Less time, bigger mine, more ores, higher required.
		"sizex": 17,
		"sizey": 17,
		"time": 110,
		"required": 7,
		"oredict": {
				0: 6,
				2: 4,
				3: 2,
				5: 0,
				6: 0,
				7: 0
				}
		},
	3: {
		"sizex": 20,
		"sizey": 20,
		"time": 105,
		"required": 10,
		"oredict": {
				0: 10,
				2: 6,
				3: 8,
				5: 0,
				6: 0,
				7: 0
				}
		},
	4: {
		"sizex": 25,
		"sizey": 25,
		"time": 100,
		"required": 15,
		"oredict": {
				0: 12,
				2: 8,
				3: 8,
				5: 2,
				6: 0,
				7: 0
				}
		},
	5: {
		"sizex": 35,
		"sizey": 35,
		"time": 100,
		"required": 18,
		"oredict": {
				0: 12,
				2: 8,
				3: 10,
				5: 4,
				6: 0,
				7: 0
				}
		},
	6: {
		"sizex": 38,
		"sizey": 38,
		"time": 90,
		"required": 20,
		"oredict": {
				0: 12,
				2: 11,
				3: 14,
				5: 5,
				6: 1,
				7: 0
				}
		},
	7: {
		"sizex": 40,
		"sizey": 40,
		"time": 90,
		"required": 25,
		"oredict": {
				0: 12,
				2: 14,
				3: 10,
				5: 6,
				6: 2,
				7: 0
				}
	},
	8: {
		"sizex": 45,
		"sizey": 45,
		"time": 85,
		"required": 30,
		"oredict": {
				0: 12,
				2: 7,
				3: 5,
				5: 7,
				6: 7,
				7: 0
				}
	},
	9: {
		"sizex": 50,
		"sizey": 50,
		"time": 75,
		"required": 35,
		"oredict": {
				0: 12,
				2: 15,
				3: 10,
				5: 9,
				6: 9,
				7: 2
				}
	},
	10: {
		"sizex": 50,
		"sizey": 50,
		"time": 60,
		"required": 40,
		"oredict": {
				0: 12,
				2: 20,
				3: 10,
				5: 10,
				6: 10,
				7: 3
				}
	},
	11: {
	"sizex": 55,
	"sizey": 55,
	"time": 60,
	"required": 50,
	"oredict": {
			0: 6,
			2: 20,
			3: 13,
			5: 12,
			6: 15,
			7: 5
				}
	},
	12: {
	"sizex": 60,
	"sizey": 60,
	"time": 55,
	"required": 55,
	"oredict": {
			0: 6,
			2: 25,
			3: 15,
			5: 11,
			6: 15,
			7: 6
				}
	},
	13: {
	"sizex": 60,
	"sizey": 60,
	"time": 55,
	"required": 55,
	"oredict": {
			0: 6,
			2: 25,
			3: 15,
			5: 11,
			6: 15,
			7: 6
				}
	},
	14: {
	"sizex": 60,
	"sizey": 60,
	"time": 50,
	"required": 57,
	"oredict": {
			0: 6,
			2: 25,
			3: 15,
			5: 11,
			6: 15,
			7: 8
				}
	},
	15: {
	"sizex": 70,
	"sizey": 70,
	"time": 50,
	"required": 60,
	"oredict": {
			0: 6,
			2: 25,
			3: 15,
			5: 15,
			6: 15,
			7: 8
				}
	},
}
func _ready() -> void:
	add_child(timer)
	timer.connect("timeout", _on_game_clock_timeout)
	timer.one_shot = true
	self.process_mode = Node.PROCESS_MODE_ALWAYS
	pass

func reset_game():
	day = 1
	Inventory.reset()
	Dronestats.reset()
	CurrencyManager.reset()

func _on_game_clock_timeout(): #when the timer ends, the player loses.
	#Reset every variable to there orginal values.
	reset_game()
	var gos = gameoverscreen.instantiate()
	add_child(gos)
	get_tree().paused = true

func reset_after_loss(): #When the player hits the "main menu" button, go back to the main menu. Also counts "winning" as a "loss."
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Menus/menus.tscn")
	pass

func get_time(): #Returns the time remaining on the global clock.
	return timer.time_left

func wind_timer():
	timer.start(diffdict[day]["time"])
	timetillloss = diffdict[day]["time"]
	#A lot of things require this to be set, setting this here.

func leave_pre(): #Called when the player leaves the main scene. AKA leaves when pressing space on mothership.
	#NOTE: this function will only be allowed to be called by mothership if the player meets the required scrap value.
	#NOTE: this means the player must wait for the tube to move enough ore to the mothership, could be bad design, needs playtesting.
	#Move all items inside drone to ship. This is just so the player doesn't NEED to wait till the very end as long as the required scrap is met.
	for item in Inventory.inventorydrone:
		Inventory.from_drone_to_mothership()
	timer.stop()
	day += 1
	if day == 15:
		reset_game()
		var win = winscreen.instantiate()
		add_child(win)
		get_tree().paused = true
		pass
		#Switch to win scene.
	else:
		get_tree().change_scene_to_file("res://Scenes/shop.tscn")
		
func leave_shop(): #Called when we leave the shop.
	get_tree().change_scene_to_file("res://Scenes/pre.tscn")
	pass
	
func leave_title(): #Called when we leave the title screen.
	seed(randi_range(0,25565)) #Do random jogic
	get_tree().change_scene_to_file("res://Scenes/pre.tscn")
	pass

func enter_tutorial(): #Called when the user wants to enter the tutorial.
	get_tree().change_scene_to_file("res://Scenes/tutorial.tscn")
	
func leave_tutorial(): #Make sure the tutorial doesn't effect the rest of the game.
	reset_game()
	get_tree().change_scene_to_file("res://Menus/menus.tscn")
	
	
