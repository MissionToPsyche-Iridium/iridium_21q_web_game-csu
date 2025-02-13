extends Node

@onready var timer = Timer.new() #Games timer.

var timetillloss: int = 60 #How much time in sec the player has till they lose.
var minesizex: int = 15 #Mine size, incs by X every loop.
var minesizey: int = 15 #Mine size Y.

@onready var pre = preload("res://Scenes/pre.tscn")

func _ready() -> void:
	add_child(timer)
	timer.connect("timeout", _on_game_clock_timeout)
	timer.one_shot = true
	timer.start(timetillloss)
	pass

func _on_game_clock_timeout(): #when the timer ends, the player loses.
	print("GAME END")
	
func get_time(): #Returns the time remaining on the global clock.
	return timer.time_left

func leave_pre(): #Called when the player leaves the main scene.
	#Move all items inside drone to ship.
	for item in Inventory.inventorydrone:
		Inventory.inventoryship.append(item)
		Inventory.inventorydrone.erase(item)
	timer.stop()
	#Temp, will leave to shop screen.
	get_tree().change_scene_to_file("res://Scenes/pre.tscn")
	
func leave_shop(): #Called when we leave the shop.
	pass
	
func start_game(): #Called when the game starts from the title screen.
	seed(randi_range(0,25565))
	pass
