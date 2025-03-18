class_name BombShooter
extends AdvancedItem



func _init() -> void:
	name = "Bomb Shooter"
	tooltip = ""
	effecttext = ["[color=green]Adds a cannon that fires an explosive every 5 seconds[/color] that travels to your mouse pointer. deals [50%] of damage to each block hit."]
	rarity = 1
	sprite = null
	maxstacks = 1
	price = 15
	packed = preload("res://Assets/items/advanced/scenes/bombshooter/bombshooter.tscn")
