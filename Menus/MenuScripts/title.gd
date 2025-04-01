extends Control
@onready var cam = $Camera2D

#Starts main game
#Game path subject to change
func _on_start_pressed() -> void:
	Gamemaster.leave_title()


#WILL BE CHANGED AT A LATER DATE#
func _on_continue_pressed() -> void:
	pass # Replace with function body.

#Opens encyclopedia screen
func _on_encyclopedia_pressed() -> void:
	get_node("../Encyclopedia").visible = true
	get_node("../ParallaxBackground").visible = false
	get_node("../Title").visible = false
	

#Opens options menu
func _on_options_pressed() -> void:
	get_node("../Options").visible = true
	get_node("../ParallaxBackground").visible = false
	get_node("../Title").visible = false
	
#Quits game
func _on_quit_pressed() -> void:
	get_tree().quit()

#CHECKS IF MOUSE IF HOVERING OVER BUTTON
#Hovering over NEW
func _on_new_mouse_entered() -> void:
	get_node("../ParallaxBackground/Shuttle/Ship/Hover New").z_index = 1
	#$"Shuttle/Ship/Hover New".z_index = 1
func _on_new_mouse_exited() -> void:
	get_node("../ParallaxBackground/Shuttle/Ship/Hover New").z_index = -1
	#$"Shuttle/Ship/Hover New".z_index = -1
	
#Hovering over LOAD
func _on_load_mouse_entered() -> void:
	get_node("../ParallaxBackground/Shuttle/Ship/Hover Load").z_index = 1
	#$"ParallaxBackground/Shuttle/Ship/Hover Load".z_index = 1
func _on_load_mouse_exited() -> void:
	get_node("../ParallaxBackground/Shuttle/Ship/Hover Load").z_index = -1
	#$"ParallaxBackground/Shuttle/Ship/Hover Load".z_index = -1

#Hovering over ENCYCLOPEDIA
func _on_encyclopedia_mouse_entered() -> void:
	get_node("../ParallaxBackground/Shuttle/Ship/Hover Ency").z_index = 1
func _on_encyclopedia_mouse_exited() -> void:
	get_node("../ParallaxBackground/Shuttle/Ship/Hover Ency").z_index = -1

#Hovering over SETTINGS
func _on_settings_mouse_entered() -> void:
	get_node("../ParallaxBackground/Shuttle/Ship/Hover Settings").z_index = 1
func _on_settings_mouse_exited() -> void:
	get_node("../ParallaxBackground/Shuttle/Ship/Hover Settings").z_index = -1
