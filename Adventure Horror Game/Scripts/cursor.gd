extends Node

var arrow = load("res://Sprites/UI/Mouse.png")
var hand = load("res://Sprites/UI/MouseHand.png")


func _ready():
	Input.set_custom_mouse_cursor(arrow, 0, Vector2(20,20))
	Input.set_custom_mouse_cursor(hand, Input.CURSOR_POINTING_HAND, Vector2(46,46))
