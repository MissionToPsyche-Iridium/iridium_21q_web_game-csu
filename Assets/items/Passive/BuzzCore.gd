class_name BuzzCore
extends Item


func _init() -> void:
	name = "Buzz Core"
	tooltip = "Bzzzzzzzzz...."
	effecttext = ["[color=green]+10%[/color] grabber cooldown.", "[color=green]+10%[/color] grabber speed."]
	rarity = 1
	sprite = preload("res://Assets/items/images/buzzcore.png")
	maxstacks = -1
	price = 10


func on_get():
	Dronestats.grabbercooldown -= (Dronestats.b_grabbercooldown * 0.10)
	Dronestats.grabberspeed += (Dronestats.b_grabberspeed * 0.10)
