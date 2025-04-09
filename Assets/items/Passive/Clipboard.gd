class_name Clipboard
extends Item


func _init() -> void:
	name = "Clipboard"
	tooltip = ""
	effecttext = [" [color=green]+1[/color] Pickup slot."]
	rarity = 0
	sprite = preload("res://Assets/items/images/clipboard.png")
	maxstacks = -1
	price = 2


func on_get():
	Inventory.dronemaxsize += 1
