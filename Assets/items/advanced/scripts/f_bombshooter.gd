extends Node2D

@onready var bombshooterexplode: PackedScene = preload("res://Assets/items/advanced/scenes/bombshooter/bombshooterexplode.tscn")
@onready var timer: Timer = $Timer
@onready var point: Node2D = $Node2D


func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())


func _on_timer_timeout() -> void:
	var explode: Node = bombshooterexplode.instantiate()
	explode.rotation = self.rotation
	add_child(explode)
	pass # Replace with function body.
