extends Node

@onready var timer = Timer.new() #Games timer.
var timetillloss = 60 #How much time in sec the player has till they lose.
var minesizex = 15 #Mine size, incs by X every loop.
var minesizey = 15


func _ready() -> void:
	add_child(timer)
	timer.connect("timeout", _on_game_clock_timeout)
	timer.one_shot = true
	wind_game_clock()
	pass 

func _on_game_clock_timeout(): #when the timer ends, the player loses.
	print("GAME END")
	
func get_time(): #Returns the time remaining on the global clock.
	return timer.time_left
	
func wind_game_clock(): #Set the timer given the timetillloss var.
	timer.start(timetillloss) # In sec.
