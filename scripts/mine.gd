class_name Mineable extends TileMapLayer

var grid = [] #Mine grid.
@export var height = 15 #Height of the mine
@export var width = 15 #Width of the mine.
@export var layersbeforegen = 3 # How many layers down before ore can appear -1.
@onready var rockonmineparts = preload("res://Objects/rockonmineparts.tscn") # Ref for particles after removing block.
@onready var pickup = preload("res://Objects/pickup.tscn")
@onready var background = $Back #Background tilesheet.


#IDS
#0 = Nothing/Air
#1 = Rock
#2 = Iron
#3 = Copper
#4 = Cant mine this rock.
#5 = Cobalt
#6 TODO Still needs block, pickup done = Gold
#7 = Cinnabar
@export var orereq = { #How many ores this mine we will spawn. 0 counts as an ore here.
	0: 0,
	2: 0,
	3: 0,
	5: 0,
	7: 0
}

var orecount = { #Dict to hold the count of tiles.
	0: 0,
	1: 0,
	2: 0,
	3: 0,
	4: 0,
	5: 0,
	6: 0,
	7: 0
}
var idpos = {
	#SUBJECT TO CHANGE
	#Dict to get the Vector2 pos of said ore on the sprite sheet.
	#Arrs are randomly picked, while single values are always selected.
	1: [Vector2(0,0), Vector2(0,1), Vector2(0,2), Vector2(0,3)],
	2: [Vector2(2,0), Vector2(2,1), Vector2(2,2)],
	3: Vector2(1,0),
	4: [Vector2(3,0), Vector2(3,1), Vector2(3,2), Vector2(3,3)],
	5: [Vector2(4, 0), Vector2(4, 1)],
	7: Vector2(5,0)
}
var backgroundtiles = [Vector2(0,0), Vector2(0,1), Vector2(0,2)] #Background tiles arr.

var tiletoparticlecolor = {
	#Color that each tile breaks down into
	#Also subject to change
	1: Color(0.184, 0.165, 0.122),
	2: Color(0.596, 0.6, 0.616),
	3: Color(0.82, 0.467, 0.18),
	5: Color(0.024, 0.302, 0.643),
	7: Color(0.706, 0.125, 0.067)
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
		#Take luck into account.
		var intluck: int = Dronestats.droneluck #How many we MUST spawn for over 100% luck.
		var chance: float = Dronestats.droneluck - intluck #Ex, 4.50 - 4 = .50
		var pickupinstance: Node2D
		#A failsafe, really doesn't like more then 7 total objects coming out of one block.
		if intluck > 7:
			intluck = 7
		if intluck == 0:
			pickupinstance = pickup.instantiate()
			pickupinstance.position = pos
			pickupinstance.id = id
			add_child(pickupinstance)
		for i in intluck:
			pickupinstance = pickup.instantiate()
			pickupinstance.position = pos
			pickupinstance.id = id
			add_child(pickupinstance)
		var roll = randf_range(0, 1)
		if roll <= chance:
			pickupinstance = pickup.instantiate()
			pickupinstance.position = pos
			pickupinstance.id = id
			add_child(pickupinstance)
	

func init_grid_array(h, w):
	#Function to setup the grid, takes in h and w to get the height and width of the 2d array.
	#Puts this all in the grid var, sets all IDs of the grid to 1, except for the edges, which are 4.
	for x in range(h):
		var col = []
		for y in range(w):
			if x == 0 or x == width-1:
				col.append(4)
			elif y == 0 or y == height-1:
				col.append(4)
			else:
				col.append(1)
		grid.append(col)
func log_grid_array():
	print("===GRID ARRAY===")
	for item in grid:
		print(item)
	print("=========")
func rand_grid_array_with_seed():
#Places ores on the mine.
	for key in orereq:
		while orereq[key] > 0:
			randi_range(layersbeforegen, height-1)
			var randx = randi_range(layersbeforegen, height-1)
			var randy = randi_range(0, width-1)
			print(randx, " ",randy)
			if grid[randx][randy] == 1: # If the grid has a rock in the place we wish to gen.
				grid[randx][randy] = key
				orereq[key] -= 1 #Remove 1 ore from that key.
				pass
			else:
				pass
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
				
			#Set background cell to be ele in 4 array.
			background.set_cell(Vector2(item, row), 0, backgroundtiles.pick_random())
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
		
	

	
