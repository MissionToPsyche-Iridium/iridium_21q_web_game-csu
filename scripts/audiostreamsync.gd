extends AudioStreamPlayer

@onready var music: AudioStreamSynchronized = self.stream
@onready var fade: AnimationPlayer = $AnimationPlayer
@onready var musicswitched = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	music.set_sync_stream_volume(0, 0) #Main Track
	music.set_sync_stream_volume(1, -60) #Times almost up track
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Gamemaster.get_time() < (Gamemaster.timetillloss/3) and !musicswitched:
		fade.play("fade")
		musicswitched = true
		pass
	pass
