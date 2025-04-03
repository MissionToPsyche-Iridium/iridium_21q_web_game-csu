class_name Chocolate
extends Item


func _init() -> void:
	name = "Chocolate"
	tooltip = "Tasty!"
	effecttext = ["[color=green]+30%[/color] drone speed."]
	rarity = 2
	sprite = preload("res://Assets/items/images/coco.png")
	maxstacks = -1
	price = 14


func on_get():
	Dronestats.dronespeed += (Dronestats.b_dronespeed * 0.30)
