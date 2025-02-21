extends Control
#Option Menu
#Potential options we can implement
#	Language
#	Volume
#	Controls

#Returns to title screen
func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Menus/Title/title.tscn")
	
	
