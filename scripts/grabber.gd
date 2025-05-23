extends Node2D
@onready var detectbox: Area2D = $MaxSize
@onready var detectboxshape: CollisionShape2D = $MaxSize/CollisionShape2D
@onready var line: Line2D = $Line2D
@onready var raycast: RayCast2D = $RayCast2D
@onready var grabberends: AnimatedSprite2D = $Line2D/GrabberEnds
@onready var grabberhitbox: Area2D = $Line2D/GrabberEnds/GrabberHitBox
@onready var hum: AudioStreamPlayer = $hum
@onready var audiomix: float = hum.volume_db

var pickupsinradius = []
var closestpickup: Pickup = null
var lowestdistance: float
var isgrabbing = false #flag if we are grabbing something
var isretracting = false #flag if we are pulling in an ore.
var inventoryfull = false #flag if the inventory is full.
var t: float = 0.0
var pickuphook: Pickup #holds the pickup we just picked up.
var localcooldowncount = Dronestats.grabbercooldown #local version of cooldown, counts down.

func _ready() -> void:
	detectboxshape.shape.radius = Dronestats.grabberrange
	#Set the max range of the raycast to the radius of the detectbox.
	raycast.target_position.x = detectboxshape.shape.radius
	t = Dronestats.grabberspeed
	Inventory.connect("on_inventory_drone_full", _on_inventory_drone_full)
	Inventory.connect("on_inventory_drone_not_full", _on_inventory_drone_not_full)

func _physics_process(delta: float) -> void:
	#Skip all of this if our inventory is full
	if inventoryfull:
		return
	if localcooldowncount > 0: #Repect localcooldown.
		localcooldowncount -= 1
		return
	#Update our pickups
	if pickupsinradius.size() != 0: #If no pickups we cannot have a closest pickup.
		if pickupsinradius.size() == 1: #if only 1 pickup that IS the closest pickup
			closestpickup = pickupsinradius[0]
		lowestdistance = INF
		for pickup in pickupsinradius:
			var distance: float = global_position.distance_squared_to(pickup.global_position)
			if distance < lowestdistance:
				lowestdistance = distance
				closestpickup = pickup
	else:
		closestpickup = null
		
	#Update our rotation and pos. but only if we are not grabbing.
	#if isgrabbing != true:
	#Removed this line, not sure if this will cause problems later.
	#With that line grabber is less "smooth"
	if closestpickup != null:
		raycast.look_at(closestpickup.global_position)
		
	#if we are not grabbing, attempt to grab something.
	if isgrabbing != true and pickupsinradius.size() != 0 and closestpickup != null and isretracting == false:
		isgrabbing = true
		pass
	#if we lose our pickup, stop grabbing
	if closestpickup == null:
		isgrabbing = false
		line.points[1] = line.points[1].lerp(Vector2(0,0), Dronestats.grabberspeed)
	#if we are not grabbing something AND not retracting, lerp to 0,0
	if isgrabbing != true and isretracting != true:
		line.points[1] = line.points[1].lerp(Vector2(0,0), Dronestats.grabberspeed)
		
	#if grabbing is active, grab it (as long as we are not retracting and there is a closest pickup.)
	if isgrabbing == true and closestpickup != null and isretracting == false:
		line.points[1] = line.points[1].lerp(to_local(closestpickup.global_position), Dronestats.grabberspeed)
		
	#if we are retracting, pull the line back.
	if isretracting == true and pickuphook != null:
		grabberends.play("retracting_grabber")
		hum.volume_db = Settings.soundfx + audiomix
		hum.pitch_scale = 0.5
		if hum.playing == false:
			hum.play()
		pickuphook.global_position = grabberhitbox.global_position
		isgrabbing = false
		line.points[1] = line.points[1].lerp(Vector2(0,0), Dronestats.grabberspeed)


func _on_max_size_body_entered(body: Pickup) -> void:
	pickupsinradius.append(body)
	pass


func _on_max_size_body_exited(body: Pickup) -> void:
	pickupsinradius.erase(body)
	pass # Replace with function body.



func _on_grabber_hit_box_body_entered(body: Pickup) -> void:
	#Move with the grabber
	isretracting = true
	body.set_collision_layer_value(1, false)
	body.set_collision_mask_value(1, false)
	pickuphook = body
	pass # Replace with function body.


func _on_collect_radius_body_entered(body: Pickup) -> void:
	if pickuphook != null and isretracting == true:
		Inventory.update_inventory_drone(body)
		grabberends.play("idle_grabber")
		get_tree().create_tween().tween_property(hum, "volume_db", -80, 1)
		get_tree().create_tween().tween_property(hum, "pitch_scale", 0.8, 1)
		pickuphook.queue_free()
		isretracting = false
		isgrabbing = false
		localcooldowncount = Dronestats.grabbercooldown
	pass # Replace with function body.
func _on_inventory_drone_full():
	inventoryfull = true
func _on_inventory_drone_not_full():
	inventoryfull = false
