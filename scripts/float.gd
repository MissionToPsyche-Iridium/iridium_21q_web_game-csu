extends SubViewportContainer

@onready var animationidle: AnimationPlayer = $idle
@onready var animationjuice: AnimationPlayer = $juice
@onready var display: MarginContainer = $"SubViewport/Shop Option"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animationidle.play("idle")
	animationidle.seek(randf_range(0,4))
	pass # Replace with function body.



func _on_buy_button_pressed() -> void:
	animationjuice.play("juice")


func on_reroll() -> void:
	animationjuice.play("juice")
