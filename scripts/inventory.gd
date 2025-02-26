extends Node

# Inventory Manager, holds both drone AND ships inventories.
@onready var inventorydrone = []
@onready var dronemaxsize: int = 5 # Max number of items we can store in the drone.
@onready var inventorydronefull = false # Flag to see if inventory is full.
@onready var itemvalues = {2: 1, 3: 2, 5: 5, 6: 7, 7: 10}  # Example: Adjust these IDs and values as per your game's design


signal on_inventory_change_drone() # When the drones inventory changes
signal on_inventory_drone_full() # When the drones inventory is full
signal on_inventory_drone_not_full() # When the drones inventory is no longer full

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if inventorydronefull:
		# Keep checking till inventory is no longer full.
		if inventorydrone.size() != dronemaxsize:
			emit_signal("on_inventory_drone_not_full")
			inventorydronefull = false

# Update inventory with items picked up by the drone.
func update_inventory_drone(pickup: Pickup):
	inventorydrone.append(pickup.id)
	print(inventorydrone)
	emit_signal("on_inventory_change_drone")
	if inventorydrone.size() == dronemaxsize:
		inventorydronefull = true
		emit_signal("on_inventory_drone_full")


# Called when one item is moved from the drone to the mothership.
func from_drone_to_mothership():
	if inventorydrone.size() != 0:
		var id = inventorydrone[0]
		inventorydrone.pop_at(0)
		emit_signal("on_inventory_change_drone")
		# Imane's Tweaks: Define the monetary value of each valuable item by ID
		# Imane's Tweaks: Check if the picked item should add currency and apply the value
		if id in itemvalues:
			CurrencyManager.add_money(itemvalues[id])
			
#Reset inv, used on run restart
func reset():
	inventorydrone = []
	inventorydronefull = false
	dronemaxsize = 5
