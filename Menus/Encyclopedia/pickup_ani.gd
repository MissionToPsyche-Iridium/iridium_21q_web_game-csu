extends TextureRect

#Number of sprites in pickup
var cols = 59

#FPS of animation
var fps = 30

#data
var time := 0.0
var sizeAtlas:= Vector2()
var currCol: int = 0
var currPos := Vector2()
var atlas: AtlasTexture = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Using copper as default upon ready
	#$".".texture = "res://Assets/pickups/coppersheet.png"
	time = 1/float(fps)
	$Timer.wait_time = time
	$Timer.timeout.connect(nextFrame)
	$Timer.start()
	
	if texture is AtlasTexture:
		atlas = texture
	
	sizeAtlas = atlas.get_size() 
	
#Handles how to get the next frame in sprite sheet
func nextFrame():
	if currCol < cols:
		currPos.x += sizeAtlas.x
		atlas.region.position.x = currPos.x
		currCol += 1
		
	if currCol >= cols:
		currPos.x = 0
		atlas.region.position.x = 0
		currCol = 0;
	pass
	
func changeTexture(text: AtlasTexture):
	atlas = text
	sizeAtlas = atlas.get_size()
	
	
