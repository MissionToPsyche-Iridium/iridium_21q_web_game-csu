class_name UltraHand
extends Item

func _init() -> void:
	name = "Ultra Hand"
	tooltip = "Reach Extender!"
	effecttext = ["[wave amp=50 freq=5 connected=1][color=#2d00e5]x2[/color][/wave] grabber range"]
	rarity = 1
	price = 5
	sprite = preload("res://Assets/items/images/Ultrahand.png")
	maxstacks = 1

func on_get(): #On buying.
	Dronestats.grabberrange += Dronestats.grabberrange
