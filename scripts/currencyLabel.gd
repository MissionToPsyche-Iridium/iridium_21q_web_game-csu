extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CurrencyManager.connect("balance_changed", _update_currency_display)
	_update_currency_display()
	pass # Replace with function body.

# Imane's Addition: Function to update the currency display.
func _update_currency_display() -> void:
	text = "Currency: " + str(CurrencyManager.get_balance())
