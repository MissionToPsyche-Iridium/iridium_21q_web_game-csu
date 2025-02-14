class_name WeightedCoin
extends Item


func _init() -> void:
	name = "Weighted Coin"
	tooltip = "It might even land on its side..."
	effecttext = ["Multiply current Luck by 2."]
	rarity = 2
	sprite = null
	price = 15


func on_get():
	Dronestats.droneluck *= Dronestats.droneluck
