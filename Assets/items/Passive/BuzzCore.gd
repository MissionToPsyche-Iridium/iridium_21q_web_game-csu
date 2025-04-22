class_name BuzzCore
extends Item

func _init() -> void:
	name = "Buzz Core"
	tooltip = "Breaks multiple blocks in a buzzing burst."
	effecttext = ["[color=yellow]+3 extra tiles[/color] mined instantly"]
	rarity = 3
	sprite = null
	maxstacks = 1
	price = 16

func on_get():
	Dronestats.buzz_strength = 3
