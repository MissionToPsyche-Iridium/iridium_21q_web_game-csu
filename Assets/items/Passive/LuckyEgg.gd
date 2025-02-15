class_name LuckyEgg
extends Item


func _init() -> void:
	name = "Lucky Egg"
	tooltip = "You feel lucky..."
	effecttext = ["[color=green]+2%[/color] Luck"]
	rarity = 0
	sprite = preload("res://Assets/items/images/LuckyEgg.png")
	price = 3


func on_get():
	Dronestats.droneluck += 0.02
