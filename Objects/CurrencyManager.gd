extends Node

@onready var balance: int = 99  # Player's current balance

signal balance_changed(new_balance)

func add_money(amount: int):
	balance += amount
	emit_signal("balance_changed", balance)

func spend_money(amount: int) -> bool:
	if balance >= amount:
		balance -= amount
		emit_signal("balance_changed", balance)
		return true
	return false

func get_balance() -> int:
	return balance
