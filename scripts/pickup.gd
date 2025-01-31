extends RigidBody2D
@onready var id: int #ID of ore, see mine.gd for list.
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var maxsize: Vector2 = sprite.scale
@onready var curscale: Vector2 = Vector2(0,0)

func _ready() -> void:
	sprite.scale = Vector2(0,0) #Setup pop-in
	if id != null:
		if id == 2:
			sprite.play("idle_iron")
		elif id == 3:
			sprite.play("idle_copper")
			
	#Random Velocity
	linear_velocity = Vector2(randf_range(-10, 20),randf_range(-10, 20))
	print(linear_velocity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Makes pickup "pop-in"
	if curscale < maxsize:
		curscale.x += 0.03
		curscale.y += 0.03
		sprite.scale = curscale
	pass
