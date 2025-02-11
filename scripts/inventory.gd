extends Node

#Inventory Mgmr, holds both drone AND ships inventorys.
@onready var inventorydrone = []
@onready var inventoryship = []
@onready var dronemaxsize: int = 5 #Max number of items we can store in the drone.
@onready var inventorydronefull = false #flag to see if inventory is full.

signal on_inventory_change_drone() #When the drones inventory changes
signal on_inventory_drone_full() #When the drones inventory is full
signal on_inventory_drone_not_full() #When the drones inventory is no longer full

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if inventorydronefull == true:
		#Keep checking till inventory is no longer full.
		if inventorydrone.size() != dronemaxsize:
			emit_signal("on_inventory_drone_not_full")
			inventorydronefull = false
	pass

func update_inventory_drone(pickup: Pickup): #
	inventorydrone.append(pickup.id)
	print(inventorydrone)
	emit_signal("on_inventory_change_drone")
	if inventorydrone.size() == dronemaxsize:
		inventorydronefull = true
		emit_signal("on_inventory_drone_full")
	pass
