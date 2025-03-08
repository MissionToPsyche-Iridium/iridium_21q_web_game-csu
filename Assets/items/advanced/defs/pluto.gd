class_name Pluto
extends AdvancedItem



func _init() -> void:
	name = "Pluto"
	tooltip = "It's a planet in our hearts..."
	effecttext = ["[color=green]Adds a orbital planet[/color] to the drone that damages blocks around it."]
	rarity = 2
	sprite = preload("res://Assets/items/images/extra/pluto.png")
	maxstacks = 1
	price = 10
	packed = preload("res://Assets/items/advanced/scenes/pluto.tscn")
