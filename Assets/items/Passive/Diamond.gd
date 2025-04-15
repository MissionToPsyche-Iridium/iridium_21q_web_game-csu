class_name Diamond
extends Item


func _init() -> void:
	name = "Diamond"
	tooltip = "Shiny!"
	effecttext = ["[color=green]+50%[/color] grabber range", "[color=red]-1[/color] Pickup slot"]
	rarity = 1
	sprite = preload("res://Assets/items/images/diamond.png")
	maxstacks = -1
	price = 8


func on_get():
	Dronestats.grabberrange += (Dronestats.b_grabberrange * 0.50)
	Inventory.dronemaxsize -= 1
