extends MarginContainer

@onready var itemname = $CenterContainer/VBoxContainer/Name
@onready var itemsprite = $CenterContainer/VBoxContainer/Sprite
@onready var itemeffectlist = $"CenterContainer/VBoxContainer/Effect Text List"
@onready var itemeffect = $"CenterContainer/VBoxContainer/Effect Text List/Effect Text 1"
@onready var itembuy = $"CenterContainer/VBoxContainer/Buy Button"
@onready var itemprice = $CenterContainer/VBoxContainer/Price
@onready var glass = $Glass
@onready var fallbacksprite: Texture2D = preload("res://Assets/items/images/noimage.png")
@onready var iteminside: Item = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	display_item(Itemdict.get_item_of_rarity_passive(0))
	pass # Replace with function body.

#Displays the item on the display.
func display_item(item: Item) -> void:
	itemname.text = item.name
	if item.sprite == null:
		itemsprite.texture = fallbacksprite
	else:
		itemsprite.texture = item.sprite
	itemeffect.text = item.effecttext[0]
	itemprice.text = str(item.price)
	iteminside = item #Grab ref of item so we can run its .on_get() effect later.


func _on_buy_button_pressed() -> void:
	#Write check here to see if player can even buy this item.
	#For now there is no check b/c we still don't have a money system fully set up.
	iteminside.on_get()
	pass # Replace with function body.
