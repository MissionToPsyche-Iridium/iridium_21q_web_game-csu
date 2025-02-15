extends Timer

@onready var stage = 1 #1-4 how broken should this block display as? we have 4 breakable sprites.
@onready var interval #Time inbetween before updating cracks.
@onready var cords: Vector2 #Knows its cords, helps keep track of timers.
@onready var crack1: AudioStreamPlayer = $"crack 1"
@onready var crack2: AudioStreamPlayer = $"crack 2"
@onready var crack3: AudioStreamPlayer = $"crack 3"
@onready var intervalarr: Array = []
@onready var spentintervals: Array = []
@onready var sounds = []
@onready var pitch = 0.6
#signals for updating tile map.
signal update_cracked_tile(stage: Vector2, cords: Vector2)
signal erase_crack_tile(ref: Timer, cords: Vector2)


#This is not needed, can be fixed and removed by just reversing the sprite sheet so that 1 = most cracked.


func _ready() -> void:
	sounds.append(crack1)
	sounds.append(crack2)
	interval = wait_time / 4
	for i in range(0,4):
		intervalarr.append(interval*i)

func play_random_sound():
	var i: int = randi_range(0, sounds.size()-1)
	pitch = pitch+0.1
	sounds[i].pitch_scale = pitch
	sounds[i].play()

func _exit_tree() -> void:# Called RIGHT before object is killed.
	emit_signal("erase_crack_tile", cords)
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for numb in intervalarr:
		if numb >= time_left and !spentintervals.has(numb):
			stage = intervalarr.find(numb)
			spentintervals.append(numb)
			emit_signal("update_cracked_tile", stage-1, cords)
			play_random_sound()
