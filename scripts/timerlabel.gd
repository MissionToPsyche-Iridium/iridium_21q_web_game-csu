extends Label

#Updates the text on the timer using the game masters timer.
var delay: int = 60
@onready var blink: AnimationPlayer = $blink

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	delay += 1
	text = "Time: " + str(roundf(Gamemaster.get_time()))
	if Gamemaster.get_time() < (Gamemaster.timetillloss/3):
		blink.play("blink")
		pass
	pass
