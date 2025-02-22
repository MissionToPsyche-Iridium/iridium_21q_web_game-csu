extends Node

#A giant dict of every item. Both Passive AND active.
@onready var passives: Array = []

func _ready() -> void:
	passives.append(LuckyEgg.new())
	passives.append(SharpeningWheel.new())
	passives.append(WeightedCoin.new())
	pass

#Returns an item of said rarity.
func get_item_of_rarity_passive(rarity: int) -> Item:
	var arr = []
	for item: Item in passives:
		if item.rarity == rarity:
			arr.append(item)
	if arr.size() == 0:
		return passives[0] #Using lucky egg if it cant find any items of that rarity.
	var roll: int = randi_range(0, arr.size()-1)
	return arr[roll]

#returns a random item taking, taking into account rarity calcs.
func get_random_item_passive() -> Item:
	var roll: int = randi_range(0,100)
	var item: Item = passives[0] #If something goes very wrong with the code, lucky egg is used to stop errors.
	if roll <= 70:
		item = get_item_of_rarity_passive(0)
	elif roll <= 70+20:
		item = get_item_of_rarity_passive(1)
	elif roll <= 70+20+9:
		item = get_item_of_rarity_passive(2)
	elif roll == 100:
		item = get_item_of_rarity_passive(3)
	return item
