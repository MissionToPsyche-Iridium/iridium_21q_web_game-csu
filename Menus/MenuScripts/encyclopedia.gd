extends Control
#Encyclopedia Menu# 

#Entry Lists#
@onready var upgradeslist = $ScrollContainer/VBoxContainer/UpgradesList
@onready var oresList = $ScrollContainer/VBoxContainer/OresList
@onready var statsList = $ScrollContainer/VBoxContainer/StatsList

#Required Scenes#
@onready var oreSprite = preload("res://Menus/Encyclopedia/pickup_ency_animation.tscn")
@onready var shopOption = preload("res://Objects/shopoption.tscn")
@onready var effectText = preload("res://Objects/effectentry.tscn")
@onready var instancedScene
@onready var instancedOre

#Key for ores#
@onready var pickArr = [2,3,5,6,7]

#Text to populate side windown#
@onready var entryInfo = $EntryInfo

func _ready():
	#Fills oreList#
	for id in pickArr:
		#Instantiates requires scenes
		instancedScene = shopOption.instantiate()
		instancedOre = oreSprite.instantiate()
		
		#Adds scene to oreList
		oresList.add_child(instancedScene)
		
		#Removes unnecessary nodes from shopOption
		instancedScene.find_child("Buy Button").free()
		instancedScene.find_child("Price").free()
		instancedScene.find_child("Effect Text List").free()
		instancedScene.find_child("Sprite").free()
		
		#Makes all sprites initially invisible 
		instancedOre.get_child(0).visible = false
		instancedOre.get_child(1).visible = false
		instancedOre.get_child(2).visible = false
		instancedOre.get_child(3).visible = false
		instancedOre.get_child(4).visible = false
		
		#Determines ore type
		match id:
			#Iron
			2:
				instancedScene.find_child("Name").text = "Iron"
				instancedScene.find_child("Name").name = "Ore"
				instancedScene.find_child("VBoxContainer").add_child(instancedOre)
				instancedOre.get_child(4).visible = true
				instancedScene.mouse_entered.connect(addInfo.bind(instancedScene.find_child("Ore").name,instancedScene.find_child("Ore").text))
				instancedScene.mouse_exited.connect(removeInfo)
			#Copper	
			3:
				instancedScene.find_child("Name").text = "Copper"
				instancedScene.find_child("Name").name = "Ore"
				instancedScene.find_child("VBoxContainer").add_child(instancedOre)
				instancedOre.get_child(2).visible = true
				instancedScene.mouse_entered.connect(addInfo.bind(instancedScene.find_child("Ore").name,instancedScene.find_child("Ore").text))
				instancedScene.mouse_exited.connect(removeInfo)
			#Cobalt
			5:
				instancedScene.find_child("Name").text = "Cobalt"
				instancedScene.find_child("Name").name = "Ore"
				instancedScene.find_child("VBoxContainer").add_child(instancedOre)
				instancedOre.get_child(1).visible = true
				instancedScene.mouse_entered.connect(addInfo.bind(instancedScene.find_child("Ore").name,instancedScene.find_child("Ore").text))
				instancedScene.mouse_exited.connect(removeInfo)
			#Gold
			6:
				instancedScene.find_child("Name").text = "Gold"
				instancedScene.find_child("Name").name = "Ore"
				instancedScene.find_child("VBoxContainer").add_child(instancedOre)
				instancedOre.get_child(3).visible = true
				instancedScene.mouse_entered.connect(addInfo.bind(instancedScene.find_child("Ore").name,instancedScene.find_child("Ore").text))
				instancedScene.mouse_exited.connect(removeInfo)
			#Cinnabar
			7:
				instancedScene.find_child("Name").text = "Cinnabar"
				instancedScene.find_child("Name").name = "Ore"
				instancedScene.find_child("VBoxContainer").add_child(instancedOre)
				instancedOre.get_child(0).visible = true
				instancedScene.mouse_entered.connect(addInfo.bind(instancedScene.find_child("Ore").name,instancedScene.find_child("Ore").text))
				instancedScene.mouse_exited.connect(removeInfo)
			#NULL
			_:
				pass
	#Fills StatsList#
	for key in Encydict.statInfo:
		#Instantiates required scene
		instancedScene = shopOption.instantiate()
		
		#Adds scene to UpgradesList
		statsList.add_child(instancedScene)
		
		#Removes unnecessary nodes from shopOption
		instancedScene.find_child("Buy Button").free()
		instancedScene.find_child("Price").free()
		instancedScene.find_child("Effect Text List").free()
		instancedScene.find_child("Sprite").free()
		
		instancedScene.find_child("Name").text = key
		instancedScene.find_child("Name").name = "Stat"
		
		#Connects signals
		instancedScene.mouse_entered.connect(addInfo.bind(instancedScene.find_child("Stat").name,instancedScene.find_child("Stat").text))
		instancedScene.mouse_exited.connect(removeInfo)
	
	#Fills UpgradesList#
	for item in Itemdict.passives:
		#Instantiates required scene
		instancedScene = shopOption.instantiate()
		
		#Adds scene to UpgradesList
		upgradeslist.add_child(instancedScene)
		
		#Removes unneccessary nodes
		instancedScene.find_child("Shop Option").display_item(item)
		instancedScene.find_child("Buy Button").free()
		instancedScene.find_child("Price").free()
		instancedScene.find_child("Effect Text List").free()
		
		#Labels scene as upgrade
		instancedScene.find_child("Name").name = "Upgrade"
		
		#Connects signals
		instancedScene.mouse_entered.connect(addInfo.bind(instancedScene.find_child("Upgrade").name,instancedScene.find_child("Upgrade").text))
		instancedScene.mouse_exited.connect(removeInfo)
		
		#Adds item to encydict
		Encydict.itemInfo[item.name] = str("Name:\n", item.name, "\n\nTooltip:\n", item.tooltip, "\n\nRarity:\n", item.rarity, "\n\nEffect:\n")
		Encydict.itemEffects[item.name] = item.effecttext
		
#Handles popup windows#
#Creates window on cursor entered
func addInfo(type,text) -> void:
	print("Entry Entered")
	var info = Label.new()
	info.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	print(type)
	#Determines entry type
	match type:
		"Ore":
			print(text)
			info.text = Encydict.oreInfo.get(text)
			entryInfo.add_child(info)
		"Stat":
			print(text)
			info.text = Encydict.statInfo.get(text)
			entryInfo.add_child(info)
		"Upgrade":
			
			print(text)
			info.text = Encydict.itemInfo.get(text)
			entryInfo.add_child(info)
			for letter in Encydict.itemEffects.get(text):
				var richInfo = effectText.instantiate()
				richInfo.text = letter
				entryInfo.add_child(richInfo)
			#print(richInfo.text)
			
			
			pass
		_:
			pass
			
#Removes window on cursor exited
func removeInfo() -> void:
	for child in entryInfo.get_child_count():
		entryInfo.get_child(child).queue_free()
	print("Entry Exited")
		
#Returns to title screen#
func _on_back_pressed() -> void:
	$"../ParallaxBackground".get_node("Shuttle").visible = true
	$"../Title".visible = true
	$".".visible = false
	
