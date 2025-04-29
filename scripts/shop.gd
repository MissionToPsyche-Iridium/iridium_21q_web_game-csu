extends Control

@onready var displays: Array = []
@onready var row: HBoxContainer = $row
@onready var parallax_layer = $ParallaxBackground/ParallaxLayer  
@onready var parallax_background = $ParallaxBackground  
@onready var background_sound = $background_sound
@onready var RerollButton =$RerollButton

var reroll_cost: int = 5  # Initial reroll cost

func _ready() -> void:
	
	reroll_cost = Dronestats.rerollcost
	RerollButton.text = "Roll Again: " + str(reroll_cost)
	
	background_sound.play()  
	for display in row.get_children():
		if display.name != "BADOP" and display is SubViewportContainer:  
			displays.append(display)

	parallax_layer.motion_mirroring = Vector2(816, 0)

func _process(delta):
	parallax_background.scroll_offset.x -= 50 * delta

func _on_reroll_button_pressed() -> void:
	if !CurrencyManager.spend_money(reroll_cost):
		print("Not enough currency to reroll.")
		return
	RerollButton.text = "Roll Again: " + str(reroll_cost) + " Scrap"
	for display in displays:
		display.display.display_item(Itemdict.get_random_item_passive())
		display.on_reroll()
		
	reroll_cost += Dronestats.rerollinc
	
func _on_return_button_pressed() -> void:
	Gamemaster.leave_shop()
	
	
