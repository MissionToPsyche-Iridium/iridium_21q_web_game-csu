class_name Bowl
extends Item


func _init() -> void:
	name = "Bowl"
	tooltip = ""
	effecttext = [" [color=green]+3[/color] Pickup slots."]
	rarity = 1
	sprite = preload("res://Assets/items/images/bowl.png")
	maxstacks = -1
	price = 5


func on_get():
	Inventory.dronemaxsize += 3
