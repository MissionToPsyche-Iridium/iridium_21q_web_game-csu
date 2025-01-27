extends Area2D
#Handles Drill code.

@export var speed = 10 #Drill speed
@export var size = 5 #Drill Size
@export var str = 1 #Drill Str

func _on_body_entered(body: Node2D) -> void:
	if body is TileMapLayer:
		
		var tilemapcords = body.local_to_map(body.to_local(to_global(position)))
		print("LOCAL POS:", position)
		print("LOCAL TO MAP:", body.local_to_map(position))
		print("GLOBAL TO MAP:", body.local_to_map(global_position))
		print("GLOBAL: ", global_position)
		#tilemapcords.y += 1
		#if tilemapcords.x < 0:
		#	tilemapcords.x += 1
		print("TILEMAPCORDS: ", tilemapcords)
		body.set_cell(tilemapcords, 0, Vector2(1,0))
		body.erase_cell(tilemapcords)
		print("DOWN")
		pass # Replace with function body.
func _on_body_exited(body: Node2D) -> void:
	print("LEAVE")
	pass 
