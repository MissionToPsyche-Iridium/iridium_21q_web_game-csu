extends RayCast2D
#Handles Drill code.
@onready var control = $"../.."
@export var speed = 10 #Drill speed, 10 = base level
@export var size = 5 #Drill Size
@export var str = 1 #Drill Str? Might be worth using, unsure.


signal mining_tile(cords: Vector2, tile: TileMapLayer, emiter: String)
signal stop_mining_tile(emiter: String)

func _physics_process(delta: float) -> void:
	if is_colliding():
		var tile = get_collider()
		if tile is TileMapLayer:
			#Weird to get tile we wish to remove
			var transform2d = PhysicsServer2D.body_get_state(get_collider_rid(), PhysicsServer2D.BODY_STATE_TRANSFORM)
			var tilepos = tile.local_to_map(transform2d[2])
			emit_signal("mining_tile", tilepos, tile, self.name)
		pass
	pass
	if !is_colliding():
		emit_signal("stop_mining_tile", self.name)
		#emit no longer colliding.
		pass
func _ready() -> void:
	pass
