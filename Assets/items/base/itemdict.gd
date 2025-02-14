extends Node

#A giant dict of every item. Both Passive AND active.
@onready var passives: Array = []

func _ready() -> void:
	passives.append(LuckyEgg.new())
	pass
