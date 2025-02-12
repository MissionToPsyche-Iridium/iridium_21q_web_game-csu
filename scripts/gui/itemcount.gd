extends Label

#Handles the X/X display on the GUI.

@onready var stringbuilder: String = "{total}/{max}"
@onready var stringholder: String = ""

func _ready() -> void:
	#Item count label
	Inventory.connect("on_inventory_change_drone", _update_inventory_text)
	Inventory.connect("on_inventory_drone_full", _inventory_full)
	Inventory.connect("on_inventory_drone_not_full", _inventory_not_full)
	stringholder = stringbuilder.format(({"total":Inventory.inventorydrone.size(), "max":Inventory.dronemaxsize}))
	set_text(stringholder)
	
func _update_inventory_text(): #Item count label.
	stringholder = stringbuilder.format(({"total":Inventory.inventorydrone.size(), "max":Inventory.dronemaxsize}))
	set_text(stringholder)

func _inventory_full():
	set("theme_override_colors/font_color", Color(1, 0, 0)) #On inv being full, set text to red.

func _inventory_not_full():
	set("theme_override_colors/font_color", Color(1, 1, 1)) #When its no longer full, set to white.
	pass
