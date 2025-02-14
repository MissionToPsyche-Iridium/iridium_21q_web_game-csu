extends Node2D

@onready var dronepacked = preload("res://Objects/drone.tscn")
@onready var minepacked = preload("res://Objects/mine.tscn")
@onready var mothershippacked = preload("res://Objects/mothership.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#instance our objects
	var drone = dronepacked.instantiate()
	var mine: Mineable = minepacked.instantiate()
	var mothership = mothershippacked.instantiate()
	#Add as child to this node.
	#Figure out dif scale function. For now hard set height and width.
	mine.height = Gamemaster.minesizey
	mine.width = Gamemaster.minesizex
	#DO NOT EDIT VARS OF OBJECTS AFTER THEY HAVE BEEN ADDED AS CHILDREN.
	add_child(mine)
	#Move drone and mothership to pos.
	drone.global_position = mine.get_hole_pos()
	mothership.global_position = mine.get_hole_pos()
	#Offset b/c they are not centered right.
	#Could be fixed by editing the actual objects but this works.
	mothership.global_position.y -= 300
	mothership.global_position.x -= 100
	add_child(drone)
	add_child(mothership)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
