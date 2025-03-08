extends Node

#The global event bus.
#Everything that "Triggers" off of other objects comes here.

#TODO: move other triggers, CurrMgr and Inventory Triggers into this global.

#GAMEPLAY RELATED
signal tile_broken() #When a tile breaks.
signal pickup_dropped() #When a pickup is dropped.


#SHOP RELATED
signal item_bought() #When the player buys an item.
signal on_reroll() #When the player rerolls.
