class_name CarbonFiberTubing
extends Item

func _init() -> void:
	name = "Carbon Fiber Tubing"
	tooltip = "Advanced carbon fiber tubing makes moving ore a breeze."
	effecttext = ["[color=green]+30%[/color] tube speed"]
	rarity = 2
	sprite = preload("res://Assets/items/images/CarbonFiberTubing.png")
	maxstacks = -1
	price = 15

func on_get():
	Dronestats.tubespeed -= (Dronestats.b_tubespeed * 0.3)
