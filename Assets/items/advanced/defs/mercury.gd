class_name Mercury
extends AdvancedItem



func _init() -> void:
	name = "Mercury"
	tooltip = "The smallest planet in our solar system."
	effecttext = ["[color=green]Adds a planet that orbits around the drone[/color] that damages blocks that touch it. Scales with [50%] of your drill speed."]
	rarity = 2
	sprite = preload("res://Assets/items/images/extra/mercury.png")
	maxstacks = 1
	price = 15
	packed = preload("res://Assets/items/advanced/scenes/mercury.tscn")
