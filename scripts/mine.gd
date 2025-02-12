class_name Mineable extends TileMapLayer

var grid = [] #Mine grid.
@export var height = 15 #Height of the mine
@export var width = 15 #Width of the mine.
@export var layersbeforegen = 3 # How many layers down before ore can appear -1.
@onready var rockonmineparts = preload("res://Objects/rockonmineparts.tscn") # Ref for particles after removing block.
@onready var pickup = preload("res://Objects/pickup.tscn")

#IDS
#0 = Nothing/Air
#1 = Rock
#2 = Iron
#3 = Copper
#4 = Cant mine this rock.
#5 TODO = Cobalt
#6 TODO = Gold
#7 TODO = Cinnabar
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
	4: 0
}
var idpos = {
	#SUBJECT TO CHANGE
	#Dict to get the Vector2 pos of said ore on the sprite sheet.
	1: [Vector2(0,0), Vector2(0,1)],
	2: Vector2(2,0),
	3: Vector2(1,0),
	4: Vector2(3,0)
}
var tiletoparticlecolor = {
	#Color that each tile breaks down into
	#Also subject to change
	1: Color(0.376, 0.231, 0.196),
	2: Color(1, 1, 1),
	3: Color(0.82, 0.467, 0.18)
}

func erase_cell_and_drop(coords: Vector2i): #the base erase_cell call but now also spawns drops for the player to pick up.
	var data: TileData = get_cell_tile_data(coords)
	var id: int = data.get_custom_data("id")
	
	#Create New Particle at pos.
	var pos: Vector2 = map_to_local(coords)
	var parsinstance: CPUParticles2D = rockonmineparts.instantiate()
	parsinstance.position = pos
	parsinstance.color = tiletoparticlecolor[id]
	parsinstance.emitting = true
	add_child(parsinstance)
	
	#Remove the cell
	erase_cell(coords)
	
	#Then spawn pickup(s) IF NEEDED. Need luck stat for player in global, not finished yet so set to 1 per block.
	if id != 1: #If we did NOT mine rock...
		var pickup: Node2D = pickup.instantiate()
		pickup.position = pos
		pickup.id = id
		add_child(pickup)
	

func init_grid_array(h, w):
	#Function to setup the grid, takes in h and w to get the height and width of the 2d array.
	#Puts this all in the grid var, sets all IDs of the grid to 1.
	for x in range(h):
		var col = []
		for y in range(w):
			col.append(1)
		grid.append(col)
func gen_rock_seed(x,y):
	if x == 0 or x == width-1:
		return 4
	if y == 0 or y == height-1:
		return 4
	if x < layersbeforegen:
		return 1
	else:
		var numb: int = randi_range(0,100)
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
				var tilevec = idpos[grid[row][item]]
				if tilevec is Array:
					#Random select of ele in array, set it to our final var.
					set_cell(Vector2(item,row), 0, tilevec[randi_range(0, tilevec.size()-1)])
					pass
				else:
					set_cell(Vector2(item,row), 0, tilevec)
func punch_enter_hole(): #Edits the tilemap to put an entrence.
	var middle = round(width / 2)
	erase_cell(Vector2(middle,0))
	#Add tube into mine.
	set_cell(Vector2(middle+1, -1), 0, Vector2(3,0))
	set_cell(Vector2(middle-1, -1), 0, Vector2(3,0))
	
func get_hole_pos(): #Gets the pos of the punched hole.
	var middle = round(width / 2)
	return self.to_global(map_to_local(Vector2i(middle,0)))
func _ready() -> void:
	#SETUP GRID.
	init_grid_array(height,width)
	rand_grid_array_with_seed()
	log_grid_array()
	count_ores()
	array_to_tile_map()
	punch_enter_hole()
		
	

	
