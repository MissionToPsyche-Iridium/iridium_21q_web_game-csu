extends Control
#Option Menu
#Potential options we can implement
#	Language
#	Volume
#	Controls


#Returns to title screen
func _on_back_pressed() -> void:
	$"../ParallaxBackground".get_node("Shuttle").visible = true
	$"../Title".visible = true
	$".".visible = false
