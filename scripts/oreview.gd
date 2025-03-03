extends VBoxContainer


@onready var countdrone = {
	2: 0,
	3: 0,
	5: 0,
	6: 0,
	7: 0
}
@onready var sprite = preload("res://Objects/pickup.tscn")

func _ready() -> void:
	Inventory.connect("on_inventory_change_drone", _update_sheet_drone)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _update_sheet_drone():
	
	pass
