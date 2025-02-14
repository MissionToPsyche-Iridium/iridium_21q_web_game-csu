extends Resource


#Should never be used to make an item, just here for active and passives to extend.

@export var name: String #Name of item shown to player.
@export var internal_name: String #Name of item in code.
@export var effect: Callable #Function for aug of stats.
@export var tooltip: String #Tooltip shown on hover.
@export var rarity: int # 0 = Common, 1 = Uncommon, 2 = Rare, 3 = Legendary.
@export var price: int #Price of item
@export var sprite: Texture2D #Image of the item.
