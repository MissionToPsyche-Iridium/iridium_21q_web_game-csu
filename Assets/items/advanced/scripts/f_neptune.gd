extends Node2D

@onready var rotationspeed: float = 0.4 #Speed at which the planet rotates.
#@onready var 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	rotation += rotationspeed * delta #Rotate around the player.
	
	if rotation >= 2*PI: #In radians so 2pi (roughly)
		rotation = rotation - 2*PI
		CurrencyManager.add_money(1)
