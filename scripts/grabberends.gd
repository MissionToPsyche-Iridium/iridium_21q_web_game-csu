extends AnimatedSprite2D
@onready var line = $".."
@onready var raycast = $"../../RayCast2D"

#Just copies what the line2d and raycast does
func _process(delta: float) -> void:
	position = line.points[1]
	rotation = raycast.rotation
	pass
func _ready() -> void:
	play("idle_grabber")
