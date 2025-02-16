extends Node

# Inventory Manager, holds both drone AND ships inventories.
@onready var inventorydrone = []
@onready var inventoryship = []
@onready var dronemaxsize: int = 5 # Max number of items we can store in the drone.
@onready var inventorydronefull = false # Flag to see if inventory is full.

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

	# Imane's Tweaks: Define the monetary value of each valuable item by ID
	var item_values = {2: 5, 3: 20, 4: 15, 5: 10}  # Example: Adjust these IDs and values as per your game's design
	# Imane's Tweaks: Check if the picked item should add currency and apply the value
	if pickup.id in item_values:
		CurrencyManager.add_money(item_values[pickup.id])

# Called when one item is moved from the drone to the mothership.
func from_drone_to_mothership():
	if inventorydrone.size() != 0:
		var id = inventorydrone[0]
		inventorydrone.pop_at(0)
		inventoryship.append(id)
		emit_signal("on_inventory_change_drone")
		print("INV SHIP:", inventoryship)
