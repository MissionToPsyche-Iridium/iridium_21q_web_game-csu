class_name AdvancedItem
extends Item

#Advanced Items can store packed scenes within them to apply to the drone on runtime.

#See item.gd for its variables.
#This has two parts, the script named after the item in the Advanced folder, and the packed scene with the same name.

@export var packed = null
#The only difference is that AdvancedItem has a packed scene inside of it.
#Null is used for the base class, the real items will have something like preload(res://ITEM_NAME.tscn)
#When given, parents itself to the drone object.

func _init(p_name: String, p_tooltip: String, p_rarity: int, p_price: int, p_maxstacks: int, p_sprite: Texture2D, p_packed: PackedScene) -> void:
	name = p_name
	tooltip = p_tooltip
	rarity = p_rarity
	price = p_price
	sprite = p_sprite
	maxstacks = p_maxstacks
	packed = p_packed
