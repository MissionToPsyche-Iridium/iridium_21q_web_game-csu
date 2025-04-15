extends Node2D

@onready var rotationspeed: float = 1 #Speed at which the sweeper rotates.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotationspeed = rotationspeed + Dronestats.orbitalrotmod
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	rotation += rotationspeed * delta #Rotate around the player.
	
