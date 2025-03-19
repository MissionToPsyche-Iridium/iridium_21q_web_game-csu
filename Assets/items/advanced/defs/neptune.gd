class_name Neptune
extends AdvancedItem



func _init() -> void:
	name = "Neptune"
	tooltip = ""
	effecttext = ["[color=green]Adds a planet that orbits around the drone[/color] for every complete rotation Neptune makes, [color=green] gain +1 scrap [/color]"]
	rarity = 2
	sprite = null
	maxstacks = 1
	price = 15
	packed = preload("res://Assets/items/advanced/scenes/neptune.tscn")
