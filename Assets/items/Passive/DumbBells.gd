class_name DumbBells
extends Item


func _init() -> void:
	name = "Dumbbells"
	tooltip = "10LB"
	effecttext = [" [color=red]-8%[/color] Drone speed", "[color=green]+15%[/color] Drill Speed"]
	rarity = 1
	sprite = preload("res://Assets/items/images/DumbBells.png")
	maxstacks = -1
	price = 7


func on_get():
	Dronestats.dronespeed -= 16
	Dronestats.drillspeed += 0.15
