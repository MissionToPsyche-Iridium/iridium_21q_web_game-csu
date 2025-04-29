extends Control
@onready var cam = $Camera2D

#Starts main game
#Game path subject to change
func _on_start_pressed() -> void:
	Gamemaster.leave_title()

#Starts tutorial	
func _on_tutorial_pressed() -> void:
	Gamemaster.enter_tutorial()
	
#Opens encyclopedia screen
func _on_encyclopedia_pressed() -> void:
	$"../Encyclopedia".visible = true
	$"../ParallaxBackground".get_node("Shuttle").visible = false
	$".".visible = false
	
#Opens options menu
func _on_options_pressed() -> void:
	$"../Options".visible = true
	$"../ParallaxBackground".get_node("Shuttle").visible = false
	$".".visible = false
	
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
func _on_quit_mouse_entered() -> void:
	get_node("../ParallaxBackground/Shuttle/Ship/Hover Load").z_index = 1
	#$"ParallaxBackground/Shuttle/Ship/Hover Load".z_index = 1
func _on_quit_mouse_exited() -> void:
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

#Hovering over CREDITS
func _on_credits_mouse_entered() -> void:
	$"../TextEdit".visible = true

func _on_credits_mouse_exited() -> void:
	$"../TextEdit".visible = false
