extends Label

#Handles all GUI code, mostly through signals

@onready var stringbuilder: String = "{total}/{max}"
@onready var stringholder: String = ""

func _ready() -> void:
	#Item count label
	Inventory.connect("on_inventory_change_drone", _update_inventory_text)
	stringholder = stringbuilder.format(({"total":Inventory.inventorydrone.size(), "max":Inventory.dronemaxsize}))
	set_text(stringholder)
	
func _update_inventory_text(): #Item count label.
	stringholder = stringbuilder.format(({"total":Inventory.inventorydrone.size(), "max":Inventory.dronemaxsize}))
	set_text(stringholder)
