class_name ExtraArm
extends Item

func _init() -> void:
	name = "Extra Arm"
	tooltip = ""
	effecttext = ["[wave amp=50 freq=5 connected=1][color=#2d00e5]1/2[/color][/wave] grabber cooldown"]
	rarity = 2
	sprite = preload("res://Assets/items/images/ExtraArm.png")
	maxstacks = -1
	price = 5

func on_get():
	Dronestats.grabbercooldown = Dronestats.grabbercooldown/2
