extends Node2D

var droneinsidedepot: bool = false #True if the drone is inside the depot hitbox.
var drone: CharacterBody2D = null
@onready var spacecount: int = 0
@onready var failure: AnimationPlayer = $depot/CPUParticles2D/AnimationPlayer


func _physics_process(delta: float) -> void:
	#Used to check for leaving.
	if droneinsidedepot and Input.is_action_just_pressed("Leave") and CurrencyManager.get_balance() >= Gamemaster.diffdict[Gamemaster.day]['required']:
		if get_tree().get_current_scene().get_name() == "Tutorial":
			Gamemaster.leave_tutorial()
		else:
			Gamemaster.leave_pre()
	if not CurrencyManager.get_balance() >= Gamemaster.diffdict[Gamemaster.day]['required'] and Input.is_action_just_pressed("Leave"):
		#TODO: play a failure sound here.
		failure.play("notmet")
		#TODO: have text say "required not met! or something."
		pass
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
