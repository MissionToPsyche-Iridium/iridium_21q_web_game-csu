class_name FourLeafClover
extends Item

func _init() -> void:
	name = "Four Leaf Clover"
	tooltip = "A leaf's worth of luck"
	effecttext = ["[wave amp=50 freq=5 connected=1][color=#2d00e5]x2[/color][/wave] current luck"]
	rarity = 3
	sprite = preload("res://Assets/items/images/FourLeafClover.png")
	maxstacks = 1
	price = 20

func on_get():
	Dronestats.droneluck += Dronestats.droneluck
