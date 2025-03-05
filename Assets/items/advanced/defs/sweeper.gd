class_name Sweeper
extends AdvancedItem



func _init() -> void:
	name = "Sweeper"
	tooltip = "For round two..."
	effecttext = ["[color=green]Adds a Sweeper[/color] to the drone that damages blocks around it."]
	rarity = 2
	sprite = null
	maxstacks = 1
	price = 10
	packed = preload("res://Assets/items/advanced/scenes/sweeper.tscn")
