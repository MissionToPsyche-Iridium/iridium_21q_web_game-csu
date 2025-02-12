extends Node

@onready var timer = Timer.new() #Games timer.
var timetillloss: int = 60 #How much time in sec the player has till they lose.

var minesizex: int = 15 #Mine size, incs by X every loop.
var minesizey: int = 15

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
