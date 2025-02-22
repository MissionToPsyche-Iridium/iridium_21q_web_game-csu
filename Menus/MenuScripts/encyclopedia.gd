extends Control
#Encyclopedia Menu
#Hope to include information on all of the potential metals and minerals that can be found in the aseroid
#Can aslo include more info on the PSYCHE mission itself as well as the spacecraft

#Returns to title screen
func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Menus/Title/title.tscn")
