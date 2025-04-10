class_name Pluto
extends AdvancedItem



func _init() -> void:
	name = "Pluto"
	tooltip = "It's a planet in our hearts..."
	#effecttext = ["[color=green]Adds a planet that orbits around the drone[/color] that damages blocks that touch it. Scales with [50%] of your drill speed."]
	effecttext = ["[color=green] +1 Planet[/color] Mines blocks it touches"] #Temp short of text
	rarity = 1
	sprite = preload("res://Assets/items/images/extra/pluto.png")
	maxstacks = 1
	price = 10
	packed = preload("res://Assets/items/advanced/scenes/pluto.tscn")
