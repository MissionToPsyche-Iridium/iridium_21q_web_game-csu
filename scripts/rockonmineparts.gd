extends CPUParticles2D

#Remove itself when finished.
func _on_finished() -> void:
	queue_free()
	pass # Replace with function body.
