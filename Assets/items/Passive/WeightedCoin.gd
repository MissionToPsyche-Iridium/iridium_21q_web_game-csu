class_name WeightedCoin
extends Item


func _init() -> void:
	name = "Weighted Coin"
	tooltip = "It might even land on its side..."
	effecttext = ["[wave amp=50 freq=5 connected=1][color=#2d00e5]x2[/color][/wave] current luck"]
	rarity = 2
	sprite = null
	price = 15


func on_get():
	Dronestats.droneluck *= Dronestats.droneluck
