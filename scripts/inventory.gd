extends Node


@onready var inventory = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_inventory(cords: Vector2):
	print(cords)
	#Takes the cords of the texture from the sheet and uses them to update the inv with the required blocks.
	#Might also take control of the GUI??? Need to work that out.
	pass
