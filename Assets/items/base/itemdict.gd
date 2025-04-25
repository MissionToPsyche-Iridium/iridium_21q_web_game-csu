extends Node

#A giant dict of every item. Both Passive AND active.
@onready var passives: Array = []
@onready var advanced: Array = []

func _ready() -> void:
	passives.append(LuckyEgg.new())
	passives.append(SharpeningWheel.new())
	passives.append(WeightedCoin.new())
	passives.append(Turbo.new())
	passives.append(Cog.new())
	passives.append(DumbBells.new())
	passives.append(Vacuum.new())
	passives.append(Clipboard.new())
	passives.append(Bowl.new())
	passives.append(Diamond.new())
	passives.append(Chocolate.new())
	passives.append(Nail.new())
	
	passives.append(Neptune.new())
	passives.append(Pluto.new())
	passives.append(Mercury.new())
	
func get_item(index: int) -> Item:
	var item: Item = passives[0] #If something goes very wrong with the code, lucky egg is used to stop errors.
	if index > -1 or index < passives.size():
		item = passives[index]
	return item

#Returns an item of said rarity.
func get_item_of_rarity_passive(rarity: int) -> Item:
	var arr = []
	for item: Item in passives:
		if item.rarity == rarity: #If the item is of the requested rarity.
			#Check to make sure we don't already have the max stacks of said item.
			if item.maxstacks != -1: #If the item HAS a limit.
				var count: int = 0
				for obtained: Item in Dronestats.boughtitems: #For each obtained item in the bought items, see if the same is the same as the item we are rolling into.
					if obtained.name == item.name: #If they have the same name.
						count =+ 1
				#After we go through all of the bought items.
				if count >= item.maxstacks: #If we have already bought more then the stackable ammt, DONT append it to our arr.
					pass
				else:
					arr.append(item)
			else:#If we dont care about the stacks, b/c there is no limit.
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
