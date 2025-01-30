extends TileMapLayer

var grid = [] #Mine grid.
@export var height = 15 #Height of the mine
@export var width = 15 #Width of the mine.
@export var layersbeforegen = 2 # How many layers down before ore can appear.

#IDS
#0 = Nothing/Air
#1 = Rock
#2 = Iron
#3 = Not Iron but something more rare all subject to change.
var chancedict = { #Chance of ore spawning. Values MUST equal 100 or weird things happen.
	0: 7,
	1: 80,
	2: 10,
	3: 3,
}
var orecount = { #Dict to hold the count of ores.
	0: 0,
	1: 0,
	2: 0,
	3: 0,
}
var idpos = {
	#SUBJECT TO CHANGE
	#Dict to get the Vector2 pos of said ore on the sprite sheet.
	0: null,
	1: Vector2(0,0),
	2: Vector2(2,0),
	3: Vector2(1,0)
}

func init_grid_array(h, w):
	#Function to setup the grid, takes in h and w to get the height and width of the 2d array.
	#Puts this all in the grid var, sets all IDs of the grid to 1.
	for x in range(h):
		var col = []
		for y in range(w):
			col.append(1)
		grid.append(col)
func gen_rock_seed(x,y):
	if x < layersbeforegen:
		return 1
	else:
		var numb = randi_range(0,100)
		for key in chancedict:
			var value = chancedict[key]
			if (numb < value):
				return key
			numb = numb - value
			pass
		return numb
		pass
	pass
func log_grid_array():
	print("===GRID ARRAY===")
	for item in grid:
		print(item)
	print("=========")
func rand_grid_array_with_seed():
	for row in range(height):
		for item in range(width):
			#Up to this point we have a 1x1 pocket of ore but we wish to do random shapes, another pass is needed.
			grid[row][item] = gen_rock_seed(row, item)
			pass
	pass
	
func count_ores():
	#Counts the ores in the grid array. Prints to console.
	for row in range(height):
		for item in range(width):
			orecount[grid[row][item]] += 1
	print("Ore count by ID: ", orecount)
# Called when the node enters the scene tree for the first time.
func array_to_tile_map():
	#Updates the tilemap with the array data.
	for row in range(height):
		for item in range(width):
			if grid[row][item] == 0:
				pass
			else:
				set_cell(Vector2(item,row), 0, idpos[grid[row][item]])
func _ready() -> void:
	#SETUP GRID.
	init_grid_array(height,width)
	seed(randi_range(0,25565)) #DO NOT CALL THIS AGAIN, SETS SEED FOR EVERY RANDOM OBJECT.
	rand_grid_array_with_seed()
	log_grid_array()
	count_ores()
	array_to_tile_map()
	

	
