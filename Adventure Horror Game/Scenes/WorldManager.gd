extends Node2D

@onready var Player = get_tree().get_root().get_node("/root/World/Player")
@onready var Camera = get_tree().get_root().get_node("/root/World/Player/Camera2D")
var brokenToy = preload("res://Sprites/Items/BrokenToy.png")
var fallenShelf = preload("res://Sprites/Items/ShelfFallen.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	var startPosition = get_tree().get_root().get_node("/root/World/Kitchen/LeftDoor")
	Player.position = startPosition.get_global_position()
	
	if SaveSystem.interactions_pickedup:
		for pickups in SaveSystem.interactions_pickedup:
			var node = get_tree().get_root().get_node("/root/World/Interactions/Interactable_"+pickups)
			node.queue_free()
			
	if SaveSystem.interactions_use:
		for name in SaveSystem.interactions_use:
			var node = get_tree().get_root().get_node("/root/World/Interactions/Interactable_"+name)
			match node.Interact_Name:
				"Toy": 
					node.find_child("Sprite2D").texture = brokenToy
					node.Used_Item = null
				"Shelf": 
					node.find_child("Sprite2D").texture = fallenShelf
					node.Used_Item = null

func TeleportRoom(newPosition, limitBottom, limitTop, limitLeft, limitRight):
	Player.position = newPosition.get_global_position()
	Camera.limit_bottom = limitBottom
	Camera.limit_top = limitTop
	Camera.limit_left = limitLeft
	Camera.limit_right = limitRight
