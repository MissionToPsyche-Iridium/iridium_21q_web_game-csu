class_name MagnetBooster
extends Item

func _init() -> void:
	name = "Magnet Booster"
	tooltip = "Your ores move toward you faster."
	effecttext = ["[color=purple]+30%[/color] Pickup Speed"]
	rarity = 1
	sprite = null  # Assign a proper sprite in the scene
	maxstacks = 5  # Allow multiple boosters to stack
	price = 10

func on_get():
	Dronestats.pickup_speed_multiplier *= 1.5  # Increase pickup speed by 50%
