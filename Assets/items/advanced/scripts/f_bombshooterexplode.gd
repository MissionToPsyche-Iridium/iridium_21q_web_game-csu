extends Node2D

@onready var particles: CPUParticles2D = $CPUParticles2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	particles.emitting = false
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	pass
