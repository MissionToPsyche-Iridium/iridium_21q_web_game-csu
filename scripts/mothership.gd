extends Node2D

var droneinsidedepot: bool = false #True if the drone is inside the depot hitbox.
var drone: CharacterBody2D = null
@onready var spacecount: int = 0


func _physics_process(delta: float) -> void:
	#Used to check for leaving.
	if droneinsidedepot and Input.is_action_just_pressed("Leave"):
		spacecount += 1
		if spacecount >= 5:
			Gamemaster.leave_pre()
	pass

func _on_depot_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D: #Checks like this are better to do then a type cast in the function.
		#Need to rewrite code that type casts like that.
		droneinsidedepot = true
		drone = body #Grab ref of drone.
func _on_depot_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		droneinsidedepot = false
		drone = null
		spacecount = 0
func _on_timer_timeout():
	Inventory.from_drone_to_mothership()
