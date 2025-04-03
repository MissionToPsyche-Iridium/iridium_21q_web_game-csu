class_name Cog
extends Item


func _init() -> void:
	name = "Cog"
	tooltip = "A bit rusty."
	effecttext = ["All Orbitals spin [color=green]+10%[/color] faster."]
	rarity = 1
	sprite = preload("res://Assets/items/images/cog.png")
	maxstacks = -1
	price = 6


func on_get():
	Dronestats.orbitalrotmod += 0.1
