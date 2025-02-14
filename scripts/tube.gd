extends Line2D

var droneinsidedepot: bool = false #True if the drone is inside the depot hitbox.
var drone: CharacterBody2D = null
@onready var timer: Timer = $Timer #Timer for keeping track of time between transfers.
@onready var soundextend: AudioStreamPlayer = $extend
@onready var soundretract: AudioStreamPlayer = $retract
func _ready() -> void:
	timer.connect("timeout", _on_timer_timeout)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	#Move point 1 of the tube to the drones pos.
	if droneinsidedepot and drone != null:
		points[1] = points[1].lerp(to_local(drone.global_position), 0.10)
		if timer.is_stopped():
			timer.start(Dronestats.tubespeed)
		pass
	elif !droneinsidedepot:
		points[1] = points[1].lerp(Vector2(50,16), 0.2)
	pass
	
func _on_depot_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D: #Checks like this are better to do then a type cast in the function.
		#Need to rewrite code that type casts like that.
		droneinsidedepot = true
		drone = body #Grab ref of drone.
		soundextend.pitch_scale = randf_range(1, 1.2)
		soundextend.play()
func _on_depot_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		droneinsidedepot = false
		drone = null
		soundretract.pitch_scale = randf_range(1, 1.2)
		soundretract.play()
		timer.stop()
		
func _on_timer_timeout():
	Inventory.from_drone_to_mothership()
