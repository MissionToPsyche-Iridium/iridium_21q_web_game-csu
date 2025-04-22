class_name CoolingSystem
extends Item

func _init() -> void:
	name = "Cooling System"
	tooltip = "Prevents overheating – mine continuously."
	effecttext = ["[color=cyan]No mining cooldown[/color]"]
	rarity = 2
	sprite = null  # Assign your sprite here
	maxstacks = 1
	price = 6

func on_get():
	Dronestats.has_cooling_system = true
