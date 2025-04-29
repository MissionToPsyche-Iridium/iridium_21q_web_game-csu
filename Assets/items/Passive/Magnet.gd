class_name Magnet
extends Item

func _init() -> void:
	name = "Magnet"
	tooltip = ""
	effecttext = ["[color=green]+8%[/color] Tube Speed", "[color=green]+10%[/color] Grabber speed"]
	rarity = 1
	sprite = preload("res://Assets/items/images/magnet.png")
	maxstacks = -1
	price = 7


func on_get():
	Dronestats.tubespeed -= (Dronestats.b_tubespeed * 0.08)
	Dronestats.grabberspeed += (Dronestats.b_grabberspeed * 0.10)
