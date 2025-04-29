class_name Vacuum
extends Item


func _init() -> void:
	name = "Vacuum"
	tooltip = "It sweeps!"
	effecttext = ["[color=green]+15%[/color] Tube Speed"]
	rarity = 0
	sprite = preload("res://Assets/items/images/Vacuum.png")
	maxstacks = -1
	price = 6


func on_get():
	Dronestats.tubespeed -= (Dronestats.b_tubespeed * 0.15)
