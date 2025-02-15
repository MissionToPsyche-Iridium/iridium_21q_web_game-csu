extends SubViewportContainer

@onready var animationidle: AnimationPlayer = $idle
@onready var animationjuice: AnimationPlayer = $juice


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animationidle.play("idle")
	pass # Replace with function body.



func _on_buy_button_pressed() -> void:
	animationjuice.play("juice")
	pass # Replace with function body.
