extends Control
#Pause menu

#Resume paused game
func _on_resume_pressed() -> void:
	get_tree().quit()

#Options menu
#Will likely have less options that title screen option menu
#Likely just Controls and Volume
func _on_options_pressed() -> void:
	pass

#Return to title screen
#Should add a "Are you sure? Y/N" popup 
func _on_return_to_title_pressed() -> void:
	get_tree().change_scene_to_file("res://Menus/title.tscn")
