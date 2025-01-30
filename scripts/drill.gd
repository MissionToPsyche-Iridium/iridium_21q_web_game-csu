extends RayCast2D
#Handles Drill code.
@onready var control = $"../.."
@onready var particles = $rockparts
@onready var tilepos = null


signal mining_tile(cords: Vector2, tile: TileMapLayer, emiter: String)
signal stop_mining_tile(emiter: String)

func _physics_process(delta: float) -> void:
	if is_colliding():
		var tile = get_collider()
		if tile is TileMapLayer:
			#VERY HACKY
			#Not great for performance but fixes the "sticky drills" bug so this works for now.
			#most likely fine...
			emit_signal("stop_mining_tile", self.name)
			var temptilepos = tilepos
			#Weird to get tile we wish to remove
			var transform2d = PhysicsServer2D.body_get_state(get_collider_rid(), PhysicsServer2D.BODY_STATE_TRANSFORM)
			tilepos = tile.local_to_map(transform2d.origin)
			particles.emitting = true
			emit_signal("mining_tile", tilepos, tile, self.name)
		pass
	pass
	if !is_colliding():
		particles.emitting = false
		emit_signal("stop_mining_tile", self.name)
		#emit no longer colliding.
		pass
func _ready() -> void:
	pass
