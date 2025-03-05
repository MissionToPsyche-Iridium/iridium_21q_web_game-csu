extends ShapeCast2D


@onready var rotationspeed: int = 1 #Speed at which the sweeper rotates.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	rotation += rotationspeed * delta #Rotate around the player.
	if is_colliding():
		var collisions: int = get_collision_count()
		for i in range(collisions):
			print(collisions)
			var tile = get_collider(i)
			if tile is Mineable: #custom class from mineable object.
				#Weird to get tile we wish to remove
				var transform2d = PhysicsServer2D.body_get_state(get_collider_rid(i), PhysicsServer2D.BODY_STATE_TRANSFORM)
				var tilepos = tile.local_to_map(transform2d.origin)
				#Check to see if that tile is even breakable.
				var tilemapdata = tile.get_cell_tile_data(tilepos)
				var canmine: bool = false
				if tilemapdata != null:
					canmine = tilemapdata.get_custom_data("can_mine")
				if !canmine:
					return
				tile.damage_tile(tilepos) #Damage tile at pos.
			pass
	pass
	if !is_colliding():
		pass
		
