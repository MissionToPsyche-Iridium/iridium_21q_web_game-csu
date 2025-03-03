extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CurrencyManager.connect("balance_changed", _on_balance_changed)
	text = "Quota: " + str(CurrencyManager.get_balance()) + "/" + str(Gamemaster.diffdict[Gamemaster.day]['required'])
	pass # Replace with function body.


func _on_balance_changed():
	text = "Quota: " + str(CurrencyManager.get_balance()) + "/" + str(Gamemaster.diffdict[Gamemaster.day]['required'])
	if CurrencyManager.get_balance() >= Gamemaster.diffdict[Gamemaster.day]['required']:
		set("theme_override_colors/font_color", Color(0.44, 0.846, 0.337))
