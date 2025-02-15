extends CharacterBody2D

@onready var sprite: Node2D = $Sprites
@onready var inputdirection = null

func handle_rot(input: Vector2):
	if input == Vector2(1,0):
		#Dronestats.droneluck = 5
		sprite.rotation = .3
	elif input == Vector2(-1,0):
		sprite.rotation = -.3
	else:
		sprite.rotation = 0
	pass
func get_input():
	inputdirection = Input.get_vector("left", "right", "up", "down")
	handle_rot(inputdirection)
	velocity = inputdirection * Dronestats.dronespeed
func _physics_process(delta):
	get_input()
	#Move and slide is really weird, this CHECKS to see if we are hitting any RigidBodys
	#BUT IT also handles control...
	if move_and_slide():
		for i in get_slide_collision_count():
			var col = get_slide_collision(i)
			if col.get_collider() is RigidBody2D:
				col.get_collider().apply_force(col.get_normal() * -Dronestats.dronespeed)
