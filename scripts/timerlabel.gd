extends Label

#Updates the text on the timer using the game masters timer.
#TODO


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = "Time: " + str(roundf(Gamemaster.get_time()))
	pass
