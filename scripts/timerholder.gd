extends Node2D
#See raytimerbundle.gd for class def.
@onready var activeright: RayTimerBundle
@onready var activeleft: RayTimerBundle
@onready var activeup: RayTimerBundle
@onready var activedown: RayTimerBundle
@onready var inactivetiles = [] #Tiles NOT being mined that still have a timer attached.
var actives = [] #Active array to make code better.

@onready var tilemap: TileMapLayer #Store for tilemap object.
@onready var tilemapcracks: TileMapLayer
@onready var timer = preload("res://Objects/rocktimer.tscn") # Ref for timer.

#Ray cast Refs
@onready var raycastright = $RayCastRight
@onready var raycastleft = $RayCastLeft
@onready var raycastup = $RayCastUp
@onready var raycastdown = $RayCastDown
func _ready() -> void:
	raycastright.connect("mining_tile", _on_mining_tile)
	raycastleft.connect("mining_tile", _on_mining_tile)
	raycastdown.connect("mining_tile", _on_mining_tile)
	raycastup.connect("mining_tile", _on_mining_tile)
	
	raycastright.connect("stop_mining_tile", _stop_mining_tile)
	raycastleft.connect("stop_mining_tile", _stop_mining_tile)
	raycastdown.connect("stop_mining_tile", _stop_mining_tile)
	raycastup.connect("stop_mining_tile", _stop_mining_tile)


func _timer_timeout(spenttimer: Timer): # Called when a timer finishes.
	#Go through all actives to find the one that spent the timer.
	#Giant mess...
	if activeright != null:
		if activeright.timer == spenttimer:
			spenttimer.queue_free()
			tilemap.erase_cell_and_drop(activeright.cords)
			pass
	if activeleft != null:
		if activeleft.timer == spenttimer:
			spenttimer.queue_free()
			tilemap.erase_cell_and_drop(activeleft.cords)
			pass
	if activedown != null:
		if activedown.timer == spenttimer:
			spenttimer.queue_free()
			tilemap.erase_cell_and_drop(activedown.cords)
			pass
	if activeup != null:
		if activeup.timer == spenttimer:
			spenttimer.queue_free()
			tilemap.erase_cell_and_drop(activeup.cords)
			pass
	pass
func _update_cracked_tile(stage: int, cords: Vector2):
	tilemapcracks.set_cell(cords, 0, Vector2(stage-1, 0), 0)
	pass
func _erase_crack_tile(cords: Vector2):
	tilemapcracks.erase_cell(cords)
	pass
func active_to_inactive(bundle: RayTimerBundle):
	inactivetiles.append(bundle)
func _stop_mining_tile(emiter: String):
	#When a raycast stops mining a tile, this is emited.
	if emiter == "RayCastRight":
		if activeright != null:
			if activeright.timer != null:
				activeright.timer.paused = true
				active_to_inactive(activeright)
				activeright = null
	elif emiter == "RayCastLeft":
		if activeleft != null:
			if activeleft.timer != null:
				activeleft.timer.paused = true
				active_to_inactive(activeleft)
				activeleft = null
	elif emiter == "RayCastDown":
		if activedown != null:
			if activedown.timer != null:
				activedown.timer.paused = true
				active_to_inactive(activedown)
				activedown = null
	elif emiter == "RayCastUp":
		if activeup != null:
			if activeup.timer != null:
				activeup.timer.paused = true
				active_to_inactive(activeup)
				activeup = null
	pass

func string_to_raycast_set(emiter: String, tempbundle: RayTimerBundle): #Sets the RayTimerBundle Var of the emiter.
	if emiter == "RayCastRight":
		activeright = tempbundle
	elif emiter == "RayCastLeft":
		activeleft = tempbundle
	elif emiter == "RayCastDown":
		activedown = tempbundle
	elif emiter == "RayCastUp":
		activeup = tempbundle
func already_mining(cords: Vector2):
	if activeright != null:
		if activeright.cords == cords:
			return true
	if activeleft != null:
		if activeleft.cords == cords:
			return true
	if activedown != null:
		if activedown.cords == cords:
			return true
	if activeup != null:
		if activeup.cords == cords:
			return true
	else:
		return false

func _on_mining_tile(cords: Vector2, tilemaplayer: TileMapLayer, emiter: String) -> void:
	#Just made this so we can pass the ref to this script.
	if tilemap == null:
		tilemap = tilemaplayer
		tilemapcracks = tilemaplayer.get_node("Cracks")
	#Check to see if that tile is in the inactive tiles.
	for bundle in inactivetiles:
		if cords == bundle.cords:
			string_to_raycast_set(emiter, bundle)
			bundle.timer.paused = false
			inactivetiles.erase(bundle) #No longer inactive, remove from list.
			pass
			#if it is, set it active to the emiter.
	#Check to see if we are already mining a tile at that cords.
	if !already_mining(cords):
	#Otherwise assume its a new tile.
		var curtimer = timer.instantiate()
		tilemap.add_child(curtimer)
		curtimer.cords = cords
		curtimer.start(Dronestats.drillspeed) #Change this to speed var someday. Or come up with math form.
		curtimer.connect("timeout", _timer_timeout.bind(curtimer))
		curtimer.connect("update_cracked_tile", _update_cracked_tile)
		curtimer.connect("erase_crack_tile", _erase_crack_tile)
		var tempbundle = RayTimerBundle.new(cords, curtimer)
		string_to_raycast_set(emiter, tempbundle)
	else:
		pass
