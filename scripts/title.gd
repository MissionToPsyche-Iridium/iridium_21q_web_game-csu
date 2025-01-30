extends Control

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://pre.tscn")

func _on_continue_pressed() -> void:
	pass # Replace with function body.

func _on_encyclopedia_pressed() -> void:
	get_tree().change_scene_to_file("res://Menus/encyclopedia.tscn")

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Menus/options.tscn")
	
func _on_quit_pressed() -> void:
	get_tree().quit()
