class_name Turbo
extends Item


func _init() -> void:
	name = "Turbo Fuel"
	tooltip = "You are faster now..."
	effecttext = ["[color=green]+5%[/color] Drone Speed"]
	rarity = 0
	sprite = null
	maxstacks = -1
	price = 4
	


func on_get():
	Dronestats.dronespeed += 5
