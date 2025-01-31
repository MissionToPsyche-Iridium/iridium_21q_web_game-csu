#Custom Godot class to keep timers bundled with there Cords.
extends Node
class_name RayTimerBundle
@onready var cords: Vector2
@onready var timer: Timer

func _init(p_cords: Vector2, p_timer: Timer) -> void:
	cords = p_cords
	timer = p_timer
