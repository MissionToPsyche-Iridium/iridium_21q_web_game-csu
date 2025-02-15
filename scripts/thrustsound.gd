extends AudioStreamPlayer

var inputdirection: Vector2 # Where we are moving.
var soundtoggle: bool = false #Set to toggle sound. True = sound is playing.


func _physics_process(delta: float) -> void:
	inputdirection = Input.get_vector("left", "right", "up", "down")
	if inputdirection != Vector2(0,0):
		if soundtoggle == false:
			pitch_scale = randf_range(1,1.3)
			play(randf_range(0,6))
			soundtoggle = true
	else:
		if soundtoggle == true:
			stop()
			soundtoggle = false
