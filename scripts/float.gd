extends SubViewportContainer

@onready var animation: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation.play("idle")
	pass # Replace with function body.
