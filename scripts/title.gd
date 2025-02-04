extends Control
#Starts main game
#Game path subject to change
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://pre.tscn")

#Continues saved game
#Unsure how we will be saving player data
#No path yet 
func _on_continue_pressed() -> void:
	pass # Replace with function body.

#Opens encyclopedia screen
func _on_encyclopedia_pressed() -> void:
	get_tree().change_scene_to_file("res://Menus/encyclopedia.tscn")

#Opens options menu
func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Menus/options.tscn")
	
#Quits game
func _on_quit_pressed() -> void:
	get_tree().quit()
