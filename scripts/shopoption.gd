extends MarginContainer

# Reference to UI elements
@onready var itemname = $CenterContainer/VBoxContainer/Name
@onready var itemsprite = $CenterContainer/VBoxContainer/Sprite
@onready var itemeffectlist = $CenterContainer/VBoxContainer/"Effect Text List"
@onready var itembuy = $CenterContainer/VBoxContainer/"Buy Button"
@onready var currency_label = $CurrencyLabel
@onready var itemprice = $CenterContainer/VBoxContainer/Price
@onready var glass = $Glass
@onready var fallbacksprite: Texture2D = preload("res://Assets/items/images/noimage.png")
@onready var iteminside: Item = null
@onready var effectentry = preload("res://Objects/effectentry.tscn")
@onready var checkout: AudioStreamPlayer = $checkout

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	display_item(Itemdict.get_random_item_passive())

# Displays the item on the display.
func display_item(item: Item) -> void:
	itemname.text = item.name
	itemsprite.texture = item.sprite if item.sprite else fallbacksprite
	# Imane's Addition: Clear previous item effects to avoid display clutter.
	clear_previous_effects()
	# Imane's Addition: Display each effect text for the current item.
	display_item_effects(item.effecttext)
	itemprice.text = str(item.price)
	iteminside = item  # Grab reference of item so we can run its .on_get() effect later.
	itembuy.tooltip_text = item.tooltip

# Imane's Addition: Function to clear previous item effects from the display.
func clear_previous_effects() -> void:
	for label in itemeffectlist.get_children():
		itemeffectlist.remove_child(label)
		label.queue_free()

# Imane's Addition: Function to instantiate and display effect text labels for an item.
func display_item_effects(effect_texts: Array) -> void:
	for text in effect_texts:
		var label = effectentry.instantiate()
		label.text = "[center]" + text + "[/center]"
		itemeffectlist.add_child(label)

# Triggered when the buy button is pressed.
func _on_buy_button_pressed() -> void:
	# Imane's Tweaks: Check if player can afford the item before purchase.
	if CurrencyManager.spend_money(iteminside.price):
		checkout.play()
		iteminside.on_get()
		Dronestats.boughtitems.append(iteminside) #Make sure we keep track of what items the player owns.
		display_item(Itemdict.get_random_item_passive())  # Reroll item after purchase.
	else:
		print("Not enough currency to buy this item")
