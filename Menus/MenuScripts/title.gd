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
	get_tree().change_scene_to_file("res://Menus/Encyclopedia/encyclopedia.tscn")

#Opens options menu
func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Menus/Options/options.tscn")
	
#Quits game
func _on_quit_pressed() -> void:
	get_tree().quit()

#CHECKS IF MOUSE IF HOVERING OVER BUTTON
#Hovering over NEW
func _on_new_mouse_entered() -> void:
	$"ParallaxBackground/Shuttle/Ship/Hover New".z_index = 1
func _on_new_mouse_exited() -> void:
	$"ParallaxBackground/Shuttle/Ship/Hover New".z_index = -1
	
#Hovering over LOAD
func _on_load_mouse_entered() -> void:
	$"ParallaxBackground/Shuttle/Ship/Hover Load".z_index = 1
func _on_load_mouse_exited() -> void:
	$"ParallaxBackground/Shuttle/Ship/Hover Load".z_index = -1

#Hovering over ENCYCLOPEDIA
func _on_encyclopedia_mouse_entered() -> void:
	$"ParallaxBackground/Shuttle/Ship/Hover Ency".z_index = 1
func _on_encyclopedia_mouse_exited() -> void:
	$"ParallaxBackground/Shuttle/Ship/Hover Ency".z_index = -1

#Hovering over SETTINGS
func _on_settings_mouse_entered() -> void:
	$"ParallaxBackground/Shuttle/Ship/Hover Settings".z_index = 1
func _on_settings_mouse_exited() -> void:
	$"ParallaxBackground/Shuttle/Ship/Hover Settings".z_index = -1
