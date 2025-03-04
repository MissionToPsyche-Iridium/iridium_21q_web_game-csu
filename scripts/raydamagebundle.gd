#Custom Godot class to keep timers bundled with there Cords.
extends Node
class_name RayDamageBundle
@onready var cords: Vector2
@onready var hitpoints: float
@onready var hardness: float

func _init(p_cords: Vector2, p_hitpoints: float, p_hardness: float) -> void:
	cords = p_cords
	hitpoints = p_hitpoints
	hardness = p_hardness
