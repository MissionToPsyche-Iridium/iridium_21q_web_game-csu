class_name SharpeningWheel
extends Item


func _init() -> void:
	name = "Sharpening Wheel"
	tooltip = "Can sharpen anything, even drills."
	effecttext = ["[color=green]+5%[/color] Drill Speed"]
	rarity = 0
	sprite = preload("res://Assets/items/images/SharpWheel.png")
	maxstacks = -1
	price = 3


func on_get():
	Dronestats.drillspeed += 0.05
