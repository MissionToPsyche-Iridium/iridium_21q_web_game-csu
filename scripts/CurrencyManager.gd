extends Node

@onready var balance: int = 0  # Player's current balance

signal balance_changed()

func add_money(amount: int):
	balance += amount
	emit_signal("balance_changed")

func spend_money(amount: int) -> bool:
	if balance >= amount:
		balance -= amount
		emit_signal("balance_changed")
		return true
	return false

func get_balance() -> int:
	return balance
