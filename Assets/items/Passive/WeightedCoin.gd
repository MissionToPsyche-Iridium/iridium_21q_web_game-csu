class_name WeightedCoin
extends Item


func _init() -> void:
	name = "Weighted Coin"
	tooltip = "It might even land on its side..."
	effecttext = ["[color=green]+25%[/color] luck"]
	rarity = 2
	sprite = preload("res://Assets/items/images/WeightedCoin.png")
	maxstacks = 1
	price = 7


func on_get():
	Dronestats.droneluck += 0.25
