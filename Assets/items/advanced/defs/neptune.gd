class_name Neptune
extends AdvancedItem



func _init() -> void:
	name = "Neptune"
	tooltip = "Deep and blue."
	effecttext = ["[color=green]Adds a planet that orbits around the drone[/color] for every complete rotation Neptune makes, gain scrap [color=green]equal[/color] to the current day."]
	rarity = 2
	sprite = preload("res://Assets/items/images/extra/neptune.png")
	maxstacks = 1
	price = 15
	packed = preload("res://Assets/items/advanced/scenes/neptune.tscn")
