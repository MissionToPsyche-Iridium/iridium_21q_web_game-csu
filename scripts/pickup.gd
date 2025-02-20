class_name Pickup extends RigidBody2D
@onready var id: int #ID of ore, see mine.gd for list.
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var col: CollisionShape2D = $CollisionShape2D
var beinggrabbed: bool = false

func _ready() -> void:
	sprite.scale = Vector2(0,0) #Setup pop-in
	#Set our sprite.
	if id != 0:
		if id == 2:
			sprite.play("idle_iron")
		elif id == 3:
			sprite.play("idle_copper")
		elif id == 5:
			sprite.play("idle_cobalt")
	else:
		push_error("ERROR: Pickup has 0 ID! Destorying.")
		queue_free()
	#Random Velocity
	linear_velocity = Vector2(randf_range(-10, 20),randf_range(-10, 20))
	#tween for pop in
	var tween = create_tween()
	tween.tween_property(sprite, "scale", Vector2(0.5, 0.5), 0.2)
