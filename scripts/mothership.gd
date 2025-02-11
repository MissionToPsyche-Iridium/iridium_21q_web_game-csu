extends Node2D

#Needs to
#Accept player input for if space is pressed and the drone is inside of it to end the day early.
#Handle adding ores to the mothership.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#Upon a Charbody entering the depot.
func _on_depot_body_entered(body: CharacterBody2D) -> void:
	print(body)
	
	pass # Replace with function body.
