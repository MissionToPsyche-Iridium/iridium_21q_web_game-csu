extends Label


func _ready() -> void:
	self.text = "DAY: " + str(Gamemaster.day)
	pass
