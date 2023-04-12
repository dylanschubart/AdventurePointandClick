extends Node2D

@onready var Player = $"../Player"
@onready var Camera = $"../Player/Camera2D"

# Called when the node enters the scene tree for the first time.
func _ready():
	var startPosition = $"../Kitchen/LeftDoor"
	Player.position = startPosition.get_global_position()


func TeleportRoom(newPosition, limitBottom, limitTop, limitLeft, limitRight):
	Player.position = newPosition.get_global_position()
	Camera.limit_bottom = limitBottom
	Camera.limit_top = limitTop
	Camera.limit_left = limitLeft
	Camera.limit_right = limitRight
