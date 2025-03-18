extends Control

@onready var displays: Array = []
@onready var row: HBoxContainer = $row
@onready var parallax_layer = $ParallaxBackground/ParallaxLayer  
@onready var parallax_background = $ParallaxBackground  
@onready var background_sound = $background_sound

func _ready() -> void:
	background_sound.play()  
	for display in row.get_children():
		if display.name != "BADOP" and display is SubViewportContainer:  
			displays.append(display)

	parallax_layer.motion_mirroring = Vector2(816, 0)  # Image width now 816px

func _process(delta):
	parallax_background.scroll_offset.x -= 50 * delta


func _on_reroll_pressed() -> void:
	#Ask all displays to reroll there item.
	#TODO add active system and make it reroll.
	#TODO make reroll respect credits.
	for display in displays:
		display.display.display_item(Itemdict.get_random_item_passive())
		display.on_reroll()
