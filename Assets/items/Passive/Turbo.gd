class_name Turbo
extends Item


func _init() -> void:
	name = "Turbo Fuel"
	tooltip = "T.U.R.B.O"
	effecttext = ["[color=green]+7%[/color] Drone Speed"]
	rarity = 0
	sprite = preload("res://Assets/items/images/Turbo.png")
	maxstacks = -1
	price = 4
	


func on_get():
	Dronestats.dronespeed  = Dronestats.dronespeed + (Dronestats.b_dronespeed * 0.07)
