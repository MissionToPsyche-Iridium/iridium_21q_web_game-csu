extends Node

@onready var timer = Timer.new() #Games timer.

@onready var timetillloss: int = 120 #How much time in sec the player has till they lose.
@onready var day = 1 #Day we are on, from 1-20.

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
		"oredict": {
				0: 5,
				2: 4,
				3: 2,
				5: 0,
				7: 0
		},
		"required": 5
	},
	2: { #Less time, bigger mine, more ores, higher required.
		"sizex": 17,
		"sizey": 17,
		"time": 110,
		"oredict": {
				0: 6,
				2: 4,
				3: 2,
				5: 0,
				7: 0
		},
		"required": 7	
	}
}


func _ready() -> void:
	seed(randi_range(0,25565))
	add_child(timer)
	timer.connect("timeout", _on_game_clock_timeout)
	timer.one_shot = true
	pass

func _on_game_clock_timeout(): #when the timer ends, the player loses.
	#Reset every variable to there orginal values.
	day = 1
	Inventory.reset()
	Dronestats.reset()
	CurrencyManager.reset()
	#BRING UP GAME OVER GUI HERE.
	print("GAME END")
	
func get_time(): #Returns the time remaining on the global clock.
	return timer.time_left

func wind_timer():
	timer.start(timetillloss)

func leave_pre(): #Called when the player leaves the main scene. AKA leaves when pressing space on mothership.
	#NOTE: this function will only be allowed to be called by mothership if the player meets the required scrap.
	#Move all items inside drone to ship.
	for item in Inventory.inventorydrone:
		Inventory.inventoryship.append(item)
		Inventory.inventorydrone.erase(item)
	timer.stop()
	day += 1
	get_tree().change_scene_to_file("res://Scenes/shop.tscn")
	
func leave_shop(): #Called when we leave the shop.
	get_tree().change_scene_to_file("res://Scenes/pre.tscn")
	pass
	
func leave_title(): #Called when we leave the title screen.
	pass

func inc_day(): #incs the day by one, updating any values.
	
	pass
