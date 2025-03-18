extends RayCast2D
#Handles Drill code.
@onready var particles = $drillparts
@onready var tilepos = null


func _physics_process(delta: float) -> void:
	if is_colliding():
		var tile = get_collider()
		if tile is Mineable: #custom class from mineable object.
			particles.emitting = false
			#Weird to get tile we wish to remove
			var transform2d = PhysicsServer2D.body_get_state(get_collider_rid(), PhysicsServer2D.BODY_STATE_TRANSFORM)
			tilepos = tile.local_to_map(transform2d.origin)
			#Check to see if that tile is even breakable.
			var tilemapdata = tile.get_cell_tile_data(tilepos)
			var canmine: bool = false
			if tilemapdata != null:
				canmine = tilemapdata.get_custom_data("can_mine")
			if !canmine:
				return
			particles.emitting = true
			tile.damage_tile(tilepos, Dronestats.drillspeed) #Damage tile at pos.
		pass
	pass
	if !is_colliding():
		particles.emitting = false
		pass
func _ready() -> void:
	pass
