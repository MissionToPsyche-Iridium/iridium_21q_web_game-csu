extends MarginContainer

@onready var itemname = $CenterContainer/VBoxContainer/Name
@onready var itemsprite = $CenterContainer/VBoxContainer/Sprite
@onready var itemeffectlist = $"CenterContainer/VBoxContainer/Effect Text List"
@onready var itembuy = $"CenterContainer/VBoxContainer/Buy Button"
@onready var itemprice = $CenterContainer/VBoxContainer/Price
@onready var glass = $Glass
@onready var fallbacksprite: Texture2D = preload("res://Assets/items/images/noimage.png")
@onready var iteminside: Item = null
@onready var effectentry = preload("res://Objects/effectentry.tscn")
@onready var checkout: AudioStreamPlayer = $checkout
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	display_item(Itemdict.get_random_item_passive())
	pass # Replace with function body.

#Displays the item on the display.
func display_item(item: Item) -> void:
	itemname.text = item.name
	if item.sprite == null:
		itemsprite.texture = fallbacksprite
	else:
		itemsprite.texture = item.sprite
	#Clean up prev rich text.
	for label in itemeffectlist.get_children():
		itemeffectlist.remove_child(label)
		label.queue_free()
	var effectentryins: RichTextLabel
	#For each string in array, create a new rich text label.
	for string: String in item.effecttext:
		string = "[center]" + string + "[/center]"
		effectentryins = effectentry.instantiate()
		effectentryins.text = string
		itemeffectlist.add_child(effectentryins)
	itemprice.text = str(item.price)
	iteminside = item #Grab ref of item so we can run its .on_get() effect later.
	itembuy.tooltip_text = item.tooltip


func _on_buy_button_pressed() -> void:
	#Write check here to see if player can even buy this item.
	#For now there is no check b/c we still don't have a money system fully set up.
	checkout.play()
	iteminside.on_get()
	display_item(Itemdict.get_random_item_passive())
	#After we do that, reroll the item slot.
