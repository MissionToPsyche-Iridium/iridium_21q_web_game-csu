class_name Item
extends Resource

#Should never be used to make an item, just here for active and passives to extend.

@export var name: String #Name of item shown to player. in code.
@export var effecttext: Array = [] #Text displayed on the shop option. Supports Rich Text. Each item in the arr = new line.
@export var tooltip: String #Tooltip shown on hover.
@export var rarity: int # 0 = Common, 1 = Uncommon, 2 = Rare, 3 = Legendary.
@export var price: int #Price of item
@export var sprite: Texture2D #Image of the item.

func _init(p_name: String, p_tooltip: String, p_rarity: int, p_price: int, p_sprite: Texture2D) -> void:
	name = p_name
	tooltip = p_tooltip
	rarity = p_rarity
	price = p_price
	sprite = p_sprite

func on_get(): #On buying.
	print("ERROR: item has base the _on_get() function!")
	return 0
