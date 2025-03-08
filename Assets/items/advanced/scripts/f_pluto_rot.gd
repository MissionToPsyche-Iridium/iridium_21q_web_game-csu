extends Node2D

@onready var rotationspeed: int = 1 #Speed at which the sweeper rotates.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	rotation += rotationspeed * delta #Rotate around the player.
