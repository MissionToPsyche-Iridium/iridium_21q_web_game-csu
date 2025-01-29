extends CharacterBody2D

@export var speed = 400
@onready var sprite = $Sprites
@onready var inputdirection = null
func handle_rot(input: Vector2):
	if input == Vector2(1,0):
		sprite.rotation = .3
	elif input == Vector2(-1,0):
		sprite.rotation = -.3
	else:
		sprite.rotation = 0
	pass
func get_input():
	inputdirection = Input.get_vector("left", "right", "up", "down")
	handle_rot(inputdirection)
	velocity = inputdirection * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
