class_name Nail
extends Item


func _init() -> void:
	name = "Nail"
	tooltip = "Sharp!"
	effecttext = ["[color=green]+20%[/color] Drill Speed"]
	rarity = 1
	sprite = preload("res://Assets/items/images/nail.png")
	maxstacks = -1
	price = 5


func on_get():
	Dronestats.drillspeed += 0.20
