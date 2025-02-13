extends CPUParticles2D

#Controls the thruster parts.
var inputdirection: Vector2 # Where we are moving.
var gravityvec: Vector2 = Vector2(0,0) #Vector2 for grav.

func _physics_process(delta: float) -> void:
	inputdirection = Input.get_vector("left", "right", "up", "down")
	if inputdirection != Vector2(0,0):
		emitting = true
		gravityvec = Vector2((inputdirection.x*100)*-1, (inputdirection.y*100)*-1)
		gravity = gravityvec
	else:
		emitting = false
	
	pass
