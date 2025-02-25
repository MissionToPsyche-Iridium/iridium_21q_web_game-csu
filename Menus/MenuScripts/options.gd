extends Control
#Option Menu
#Potential options we can implement
#	Language
#	Volume
#	Controls

#Returns to title screen
func _on_back_pressed() -> void:
	get_node("../ParallaxBackground").visible = true
	get_node("../Title").visible = true
	get_node("../Options").visible = false
