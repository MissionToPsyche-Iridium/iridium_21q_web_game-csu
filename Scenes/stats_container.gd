extends VBoxContainer

# Function to update the display of drone stats
func update_stats_display():
	# Clear existing stats first
	for child in get_children():
		child.queue_free()

	# Fetch stats from the Dronestats singleton and display them
	var stats_dict = Dronestats.get_list_of_stats()
	for key in stats_dict:
		var stat_label = Label.new()
		stat_label.text = str(key) + ": " + str(stats_dict[key])  
		add_child(stat_label)

func _ready():
	update_stats_display()
	# Assuming Dronestats is an autoloaded singleton with a 'stats_updated' signal
	Dronestats.connect("stats_updated", update_stats_display)
