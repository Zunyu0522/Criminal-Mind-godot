extends Node2D

@export var inv_scene: PackedScene = preload("res://Inventory/Inventory.tscn")
@export var test_item: PackedScene = preload("res://Inventory/Items/I_Knife.tscn")

@onready var inventory: Inventory

# Called when the node enters the scene tree for the first time.
func _ready():
	inventory = inv_scene.instantiate()
	add_child(inventory)
	print("ready")
	var temp:Item = test_item.instantiate()
	add_child(temp)
	inventory.add_item(temp, 1)
	
	Dialogic.start("playthrough1")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
