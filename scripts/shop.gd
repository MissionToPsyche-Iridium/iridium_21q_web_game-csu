extends Control

@onready var displays: Array = []
@onready var row: HBoxContainer = $row

func _ready() -> void:
	for display in row.get_children():
		if display.name != "BADOP" and display is SubViewportContainer:	 #Remove the "Dud" Display to fix the juice bug.
			displays.append(display)


func _on_reroll_pressed() -> void:
	#Ask all displays to reroll there item.
	#TODO add active system and make it reroll.
	#TODO make reroll respect credits.
	for display in displays:
		display.display.display_item(Itemdict.get_random_item_passive())
		display.on_reroll()
	pass # Replace with function body.
