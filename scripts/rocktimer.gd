extends Timer

@onready var stage = 1 #1-4 how broken should this block display as? we have 4 breakable sprites.
@onready var interval #Time inbetween before updating cracks.
@onready var cords: Vector2 #Knows its cords, helps keep track of timers.

#signals for updating tile map.
signal update_cracked_tile(stage: Vector2, cords: Vector2)
signal erase_crack_tile(ref: Timer, cords: Vector2)


#This is not needed, can be fixed and removed by just reversing the sprite sheet so that 1 = most cracked.
var idict = {
	1: 4,
	2: 3,
	3: 2,
	4: 1,
}

func _ready() -> void:
	interval = wait_time / 4

func _exit_tree() -> void:# Called RIGHT before object is killed.
	emit_signal("erase_crack_tile", cords)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in range(1,5):
		if time_left >= interval * i:
			emit_signal("update_cracked_tile", idict[i], cords)
			pass
	
	#Compare time remaining to wait time.
	#send signal based on number
	pass
