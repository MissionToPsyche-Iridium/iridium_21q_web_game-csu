class_name PencilSharpner
extends Item


func _init() -> void:
	name = "Pencil Sharpner"
	tooltip = "Can sharpen anything, even drills."
	effecttext = ["[color=green]+5%[/color] Drill Speed"]
	rarity = 0
	sprite = null
	price = 3


func on_get():
	Dronestats.drillspeed -= 0.05
