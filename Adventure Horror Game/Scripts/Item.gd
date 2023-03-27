extends Node2D

var Interact_Name
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func set_item(nm):
	Interact_Name = nm
	$TextureRect.texture = load("res://Sprites/item_icons/" + Interact_Name + ".png")
